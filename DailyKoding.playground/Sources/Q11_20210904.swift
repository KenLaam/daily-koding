import Foundation

/// Implement an autocomplete system. That is, given a query string s and a set of all possible query strings, return all strings in the set that have s as a prefix.
/// For example, given the query string de and the set of strings [dog, deer, deal], return [deer, deal].
/// Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.

public class Q11_20210904: NSObject {
  public static func findStringIn(_ words: [String], query: String) -> [String] {
    let tree = Trie(words)
    return tree.find(query)
  }
  
  class Trie {
    var root: Node
    
    init(_ words: [String]) {
      root = Node()
      words.forEach { root.insert($0) }
    }
    
    func find(_ query: String) -> [String] {
      var currentNode: Node? = nil
      for q in query {
        if currentNode == nil {
          currentNode = root.children[q]
        } else {
          currentNode = currentNode?.children[q]
        }
      }
      return currentNode?.allStrings() ?? []
    }
     
    class Node {
      let char: Character?
      var parent: Node?
      var children: [Character: Node]
      
      init(_ char: Character? = nil, parent: Node? = nil) {
        self.char = char
        self.children = [:]
        self.parent = parent
      }
      
      var isLeaf: Bool {
        parent != nil && children.isEmpty
      }
      
      func insert(_ word: String) {
        if word.isEmpty {
          return
        }
        let firstChar = word.first!
        var child = children[firstChar]
        if child == nil {
          child = Node(firstChar, parent: self)
          children[firstChar] = child
        }
        
        if word.count > 1 {
          let remainingWord = String(word.dropFirst())
          child?.insert(remainingWord)
        }
      }
      
      func stringFromRoot() -> String {
        if let char = char {
          if parent == nil {
            return String(char)
          } else {
            return (parent?.stringFromRoot() ?? "") + String(char)
          }
        }
        return ""
      }
      
      func findLeaves() -> [Node] {
        var leaves: [Node] = []
        for (_, node) in children {
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
}
