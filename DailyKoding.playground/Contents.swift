import Foundation

let height = 23
let steps = [1, 3, 5]

runningBlock("Fibo") {
  Q12_20210904.findSteps_fibo(height: height, steps: steps)
}

runningBlock("Dynamic") {
  Q12_20210904.findWays_dynamic(height: height, steps: steps)
}
