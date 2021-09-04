import Foundation

/// Implement an autocomplete system. That is, given a query string s and a set of all possible query strings, return all strings in the set that have s as a prefix.
/// For example, given the query string de and the set of strings [dog, deer, deal], return [deer, deal].
/// Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.

public class Q11_20210904: NSObject {
  public static func findStringIn(_ array: [String], query: String) -> [String] {
    let tree = Tree()
    tree.addStrings(array)
    
    return tree.find(query)
  }
  
  class Tree {
    var roots: [Node] = []
    
    func addStrings(_ array: [String]) {
      for string in array {
        addNew(string: string)
      }
    }
    
    func addNew(string: String) {
      if string.isEmpty {
        return
      }
      var currentNode: Node? = nil
      for char in string {
        if currentNode != nil {
          currentNode = currentNode?.addChild(char)
        } else if let node = findInRoot(char) {
          currentNode = node
        } else {
          currentNode = Node(char)
          roots.append(currentNode!)
        }
      }
    }
    
    func find(_ query: String) -> [String] {
      var currentNode: Node? = nil
      for q in query {
        if currentNode == nil {
          currentNode = findInRoot(q)
        } else {
          currentNode = currentNode?.findChild(q)
        }
      }
      return currentNode?.allStrings() ?? []
    }
    
    func findInRoot(_ char: Character) -> Node? {
      return roots.first(where: { $0.char == char })
    }
  }
  
  class Node {
    let char: Character
    var parent: Node?
    var children: [Node]
    
    init(_ value: Character, parent: Node? = nil) {
      self.char = value
      self.children = []
      self.parent = parent
    }
    
    var isLeaf: Bool {
      parent != nil && children.isEmpty
    }
    
    func addChild(_ char: Character) -> Node {
      if let existChild = children.first(where: { $0.char == char }) {
        return existChild
      }
      let newChild = Node(char, parent: self)
      children.append(newChild)
      return newChild
    }
    
    func findChild(_ char: Character) -> Node? {
      return children.first { $0.char == char }
    }
    
    func childExist(_ char: Character) -> Bool {
      children.map{$0.char}.contains(char)
    }
    
    func stringFromRoot() -> String {
      guard let parent = parent else {
        return String(char)
      }
      return parent.stringFromRoot() + String(char)
    }
    
    func findLeaves() -> [Node] {
      var leaves: [Node] = []
      for node in children {
        if node.isLeaf {
          leaves.append(node)
        } else {
          leaves.append(contentsOf: node.findLeaves())
        }
      }
      return leaves
    }
    
    func allStrings() -> [String] {
      return findLeaves().map{ $0.stringFromRoot() }
    }
  }
}
