import Foundation

///cons(a, b) constructs a pair, and car(pair) and cdr(pair) returns the first and last element of that pair. For example, car(cons(3, 4)) returns 3, and cdr(cons(3, 4)) returns 4.
///
///Given this implementation of cons:
///
///def cons(a, b):
/// def pair(f):
/// return f(a, b)
///return pair
///
///Implement car and cdr.

public class Q5_20210809: NSObject {
  public typealias KPair = (left: Int, right: Int)
  public static func cons(a: Int, b: Int) -> KPair {
    return (a, b)
  }
  
  public static func car(_ pair: KPair) -> Int {
    return pair.left
  }
  
  public static func cdr(_ pair: KPair) -> Int {
    return pair.right
  }
}
