import Foundation

public func measure(block: @escaping () -> Void) {
  let startTime = Date()
  block()
  let endTime = Date()
  print("Total time: \(endTime.timeIntervalSince(startTime))")
}

public func randomNumber() -> Int {
  return Int.random(in: 0...1000)
}

public func randomNumbers(length: Int = 200) -> [Int] {
  var array = [Int]()
  for _ in 0..<length {
    array.append(randomNumber())
  }
  return array
}
