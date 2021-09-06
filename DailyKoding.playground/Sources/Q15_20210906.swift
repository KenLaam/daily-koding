import Foundation

/// Given a stream of elements too large to store in memory, pick a random element from the stream with uniform probability.

public class Q15_20210906 {
  private static var count = 0
  private static var res = 0
  
  public static func pickRandom(x: Int) -> Int {
    count += 1
    if count == 1 {
      return x
    }
    
    let randomNumber = Int.random(in: 0..<count)
    if randomNumber == count - 1 {
      res = randomNumber
    }
    return res
  }
}
