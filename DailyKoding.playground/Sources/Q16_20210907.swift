import Foundation

/// You run an e-commerce website and want to record the last N order ids in a log. Implement a data structure to accomplish this, with the following API:
///   record(order_id): adds the order_id to the log
///   get_last(i): gets the ith last element from the log. i is guaranteed to be smaller than or equal to N.
///
/// You should be as efficient with time and space as possible.

public class Q16_20210907 {
  
  public class Orders {
    private var first: Order?
    private var last: Order?
    private var length = 0
    
    public init() {
      first = nil
      last = nil
    }
    
    public func record(order: Order) {
      if first == nil {
        first = order
        last = order
      } else {
        last?.next = order
        order.previous = last
        last = order
      }
      length += 1
    }
    
    public func record(orderId: String, total: Double) {
      record(order: Order(id: orderId, total: total))
    }
    
    public func printAllOrders() {
      var currentOrder = first
      var index = 0
      while currentOrder != nil {
        print("\(index) - \(currentOrder!.description)")
        currentOrder = currentOrder?.next
        index += 1
      }
    }
    
    public func getLast(i: Int) -> Order? {
      var index = i
      var currentOrder: Order?
      while index > 0 {
        if currentOrder == nil {
          currentOrder = last
        } else {
          currentOrder = currentOrder?.previous
        }
        index -= 1
      }
      return currentOrder
    }
  }
  
  public class Order {
    let id: String
    let total: Double
    var previous: Order?
    var next: Order?
    
    init(id: String, total: Double) {
      self.id = id
      self.total = total
    }
    
    public var description: String {
      "Order \(id): \(String(format: "$%.2f", total))"
    }
  }
}
