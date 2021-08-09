import Foundation

///Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), which deserializes the string back into the tree.
///
///For example, given the following Node class
///
///class Node:
/// def __init__(self, val, left=None, right=None):
///          self.val = val
///          self.left = left
///          self.right = right
///
///          The following test should pass:
///
///          node = Node('root', Node('left', Node('left.left')), Node('right'))
///          assert deserialize(serialize(node)).left.left.val == 'left.left'

public class Q3_20210807: NSObject {
  private static let SEPARATOR = ","
  private static let NIL_VALUE = "nil"
  public class Node {
    public var left, right: Node?
    public let value: String
    
    public init(value: String, left: Node? = nil, right: Node? = nil) {
      self.value = value
      self.left = left
      self.right = right
    }
  }
  
  public static func serialize(root: Node) -> String {
    return serialize(node: root).joined(separator: SEPARATOR)
  }
  
  private static func serialize(node: Node?) -> [String] {
    guard let node = node else { return [NIL_VALUE]}
    var result = [node.value]
    result.append(contentsOf: serialize(node: node.left))
    result.append(contentsOf: serialize(node: node.right))
    return result
  }
  
  public static func deserialize(string: String?) -> Node? {
    guard let string = string else { return nil }
    var nodes = string.split(separator: Character(SEPARATOR)).map{ String($0) }
    return deserialize(array: &nodes)
  }
  
  private static func deserialize(array: inout [String]) -> Node? {
    guard let firstValue = array.first else { return nil }
    if firstValue == NIL_VALUE {
      array = Array(array.dropFirst())
      return nil
    }
    
    let node = Node(value: firstValue)
    array = Array(array.dropFirst())
    node.left = deserialize(array: &array)
    node.right = deserialize(array: &array)
    return node
  }
}
