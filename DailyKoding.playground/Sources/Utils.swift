import Foundation

public func measure(block: @escaping () -> Void) {
  let startTime = Date()
  block()
  let endTime = Date()
  print("Total time: \(endTime.distance(to: startTime))")
}
