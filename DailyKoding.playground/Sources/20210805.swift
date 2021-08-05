import Foundation

///Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
///
///For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.

// MARK - Easiest way, brute force
public func includeSumPair(in array: [Int], total: Int) -> Bool {
  for i in 0..<array.count - 1  {
    for j in i..<array.count {
      if array[i] + array[j] == total {
        return true
      }
    }
  }
  return false
}

public func includeSumPairImproved(in array: [Int], total: Int) -> Bool {
  let sortedArray = array.sorted()
  var i = 0
  var pivot = sortedArray.count - 1
  while i != pivot {
    let sum = sortedArray[i] + sortedArray[pivot]
    if sum < total {
      i += 1
    } else if sum > total {
      pivot -= 1
    } else {
      return true
    }
  }
  return false
}
