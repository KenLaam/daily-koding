import Foundation

/// There exists a staircase with N steps, and you can climb up either 1 or 2 steps at a time. Given N, write a function that returns the number of unique ways you can climb the staircase. The order of the steps matters.
///
/// For example, if N is 4, then there are 5 unique ways:
/// - 1, 1, 1, 1
/// - 2, 1, 1
/// - 1, 2, 1
/// - 1, 1, 2
/// - 2, 2
///
/// What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time.

public class Q12_20210904 {
  public static func findSteps_fibo(height: Int, steps: [Int]) -> Int {
    if height < 0 {
      return 0
    }
    
    if height == 0 {
      return 1
    }
    
    if steps.contains(height) {
      return 1 + steps.reduce(0) { result, step in
        if step < height {
          return result + findSteps_fibo(height: height - step, steps: steps)
        }
        return result
      }
    }
    
    return steps.reduce(0) { result, step in
      if step < height {
        return result + findSteps_fibo(height: height - step, steps: steps)
      }
      return result
    }
  }
  
  public static func findWays_dynamic(height: Int, steps: [Int]) -> Int {
    var cache = Array(repeating: 0, count: height + 1)
    cache[0] = 1
    for i in 1...height {
      cache[i] += steps.reduce(0, { result, step in
        if i - step >= 0 {
          return result + cache[i - step]
        }
        return result
      })
    }
    return cache[height]
  }
}
