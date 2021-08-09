import Foundation

///Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.
///
///For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would be [2, 3, 6].
///
///Follow-up: what if you can't use division?

public class Q2_20210806: NSObject {
  
  // MARK: - Easiest way, brute force, O(n), cannot handle number is 0
  public static func simpleSolution(array: [Int]) -> [Int] {
    var result = [Int]()
    let product = array.reduce(1, *)
    for num in array {
      result.append(product / num)
    }
    return result
  }
  
  // MARK: - Easiest way, no division, O(2n)
  public static func advancedSolution(array: [Int]) -> [Int] {
    var result = [Int]()
    var forward = [Int]()
    var backward = [Int]()
    
    // Calculate 2 product arrays forward & backward
    for (index, _) in array.enumerated() {
      let lastIndex = array.count - 1 - index
      if index == 0 {
        forward.append(array[0])
        backward.append(array[lastIndex])
      } else if index == array.count - 1 {
        forward.append(array[index] * forward[index-1])
        backward.insert(array[lastIndex] * backward[0], at: 0)
      } else {
        forward.append(array[index] * forward[index-1])
        backward.insert(array[lastIndex] * backward[0], at: 0)
      }
    }
        
    // Map result
    for (index, _) in array.enumerated() {
      var product: Int
      if index == 0 {
        product = backward[index+1]
      } else if index == array.count-1 {
        product = forward[index-1]
      } else {
        product = forward[index-1] * backward[index+1]
      }
      result.append(product)
    }
    
    
    return result
  }
}
