import Foundation

/// This problem was asked by Google.
///
/// A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.
///
/// Given the root to a binary tree, count the number of unival subtrees.
///
/// For example, the following tree has 5 unival subtrees:

///    0
///   / \
///  1   0
///     / \
///    1   0
///   / \
///  1   1


public class Q8_20210812: NSObject {
  public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
      self.val = val
      self.left = left
      self.right = right
    }
    
    
    func isSubUnivalTree() -> Bool {
      if let left = left, left.val != val {
        return false
      }
      
      if let right = right, right.val != val {
        return false
      }
      
      return true
    }
  }
  
  public static func countUnivalTree(_ root: TreeNode) -> Int {
    var count = 0
    
    if root.isSubUnivalTree() {
      count += 1
    }
    if let left = root.left {
      count += countUnivalTree(left)
    }
    
    if let right = root.right {
      count += countUnivalTree(right)
    }
    
    return count
  }
}



