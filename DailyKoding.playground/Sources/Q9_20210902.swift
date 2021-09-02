import Foundation

///Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.
///For example, [2, 4, 6, 2, 5] should return 13, since we pick 2, 6, and 5. [5, 1, 1, 5] should return 10, since we pick 5 and 5.
/// Explain in Vietnamese => non-adjacent numbers là các số ko liền kề trong mảng,

public class Q9_20210902: NSObject {
  public static func findMaxSumNonAdjacentNumber(_ array: [Int]) -> Int {
    if array.isEmpty {
      return 0
    }
    
    var incl = 0
    var excl = 0
    
    for index in 0..<array.count {
      if index == 0 {
        incl = array[index]
        continue
      }
      let newMax = max(excl + array[index], incl)
      excl = incl
      incl = newMax
    }
  
    return max(incl, excl)
  }
}
