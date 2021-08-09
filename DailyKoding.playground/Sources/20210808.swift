import Foundation

///Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.
///
///For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
///
///You can modify the input array in-place.

public class Q4_20210808: NSObject {
  public static func firstMissingPositiveNaiveMode(_ array: [Int]) -> Int {
    let tempArr = array.sorted()
    var result = 0
    for num in tempArr {
      if num > 0 {
        if num - result > 1 {
          return result + 1
        }
        result = num
      }
    }
    return result + 1
  }
  
  public static func firstMissingPositive(_ nums: [Int]) -> Int {
    /// Create flag array with initial value = 0, size = N + 1, worst case is linear array
    /// If elemen is greater than 0 and smaller than N + 1, update element at index element - 1 due to array start from 0 not 1
    var flags = Array(repeating: 0, count: nums.count + 1)
    for num in nums {
      if num > 0, num < flags.count {
        flags[num-1] = num
      }
    }
    
    /// Traverse flag array to get answer, stop condition is flag = 0 => missing array, else increase 0 if not equal 0
    var result = 1
    for flag in flags {
      if flag == 0 {
        return result
      } else {
        result += 1
      }
    }
    return result
  }
}
