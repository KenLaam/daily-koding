import Foundation

///An XOR linked list is a more memory efficient doubly linked list. Instead of each node holding next and prev fields, it holds a field named both, which is an XOR of the next node and the previous node. Implement an XOR linked list; it has an add(element) which adds the element to the end, and a get(index) which returns the node at index.
///
///If using a language that has no pointers (such as Python), you can assume you have access to get_pointer and dereference_pointer functions that converts between nodes and memory addresses.


public class Q6_20210810: NSObject {
  public class XorList {
    var head: UnsafeMutablePointer<XorNode>? = nil
    var tail: UnsafeMutablePointer<XorNode>? = nil
    var length = 0
    
    public init() {}
    
    public func add(_ value: Int) {
      let newSlice = allocate(value)
      if head != nil {
        newSlice.pointee.npxAddr = xor(tail, nil)
        tail?.pointee.npxAddr = xor(newSlice, xor(tail?.pointee.npxAddr, nil))
        tail = newSlice
      } else {
        tail = newSlice
        head = newSlice
      }
      length += 1
    }
    
    public func get(_ index: Int) -> XorNode? {
      guard index < length, index >= 0, length > 0 else { return nil }
      
      var currentIndex = 0
      var currentNode = head
      var prevNode, nextNode: UnsafeMutablePointer<XorNode>?
      while currentIndex != index {
        next(&prevNode, &currentNode, &nextNode)
        currentIndex += 1
      }
      
      return currentNode?.pointee
    }
    
    func xor(_ predecessor: UnsafeMutablePointer<XorNode>?, _ successor: UnsafeMutablePointer<XorNode>?) -> UnsafeMutablePointer<XorNode>? {
      let next = UInt(bitPattern: predecessor) ^ UInt(bitPattern: successor)
      return UnsafeMutablePointer(bitPattern: next)
    }
    
    func allocate(_ value: Int) -> UnsafeMutablePointer<XorNode> {
      let slice = UnsafeMutablePointer<XorNode>.allocate(capacity: 1)
      slice.initialize(to: XorNode(value: value))
      return slice
    }
    
    internal func next(
      _ prev: inout UnsafeMutablePointer<XorNode>?,
      _ curr: inout UnsafeMutablePointer<XorNode>?,
      _ next: inout UnsafeMutablePointer<XorNode>?
      ) {
      next = xor(prev, curr?.pointee.npxAddr)
      prev = curr
      curr = next
    }
  }
  
  public class XorNode {
    var npxAddr: UnsafeMutablePointer<XorNode>? = nil
    public var value: Int
    
    public init(value: Int) {
      self.value = value
    }
  }
}
