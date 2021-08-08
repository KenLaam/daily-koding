import Foundation

///Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.
///
///For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
///
///You can modify the input array in-place.

public class Q4_20210808: NSObject {
  public static func firstMissingPositiveNaiveMode(_ array: [Int]) -> Int {
    var tempArr = [Int]()
    for element in array {
      if element > 0 {
        tempArr.append(element)
      }
    }
    tempArr.sort()
    var result = 1
    var index = 0
    while true {      
      let diff = tempArr[index] - result
      if index == tempArr.count - 1 {
        if diff == 0 {
          result += 1
        }
        break
      } else {
        if diff == 0 {
          result += 1
          index += 1
        } else {
          break
        }
      }
    }
    return result
  }
  
  public static func firstMissingPositive(_ nums: [Int]) -> Int {
    var flags = Array(repeating: 0, count: nums.count + 1)
    for num in nums {
      if num > 0, num < flags.count {
        flags[num-1] = num
      }
    }
    
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
