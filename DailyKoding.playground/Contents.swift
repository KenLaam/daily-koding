import UIKit
let max = 100_000
let array = randomNumbers(length: max, in: 1...max)

runningBlock("firstMissingPositive Extreme mode") {
  print(Q4_20210808.firstMissingPositive(array))
}
