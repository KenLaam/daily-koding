import Foundation

public func runningBlock(_ title: String, block: @escaping () -> Void) {
  print("\n=== Start \(title) ===")
  let startTime = Date()
  block()
  let endTime = Date()
  print("=== Finish \(title) ===\n")
  print("Total time: \(endTime.timeIntervalSince(startTime))")
}

public func randomNumber() -> Int {
  return Int.random(in: 1...10)
}

public func randomNumbers(length: Int = 200) -> [Int] {
  var array = [Int]()
  for _ in 0..<length {
    array.append(randomNumber())
  }
  return array
}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
  static var className: String {
        return String(describing: self)
    }

  var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
