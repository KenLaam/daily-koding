import Foundation

/// Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.
///
/// For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".

public class Q13_20210905 {
  public static func findLongestDistinctString(text: String, distinct: Int) -> String {
    var currentSub = ""
    var maxSub = ""
    for char in text {
      let s = String(char)
      currentSub.append(s)
      while Set(currentSub).count > distinct {
        currentSub.removeFirst()
      }
      if maxSub.count < currentSub.count {
        maxSub = currentSub
      }
    }
    return maxSub
  }

  public static func findLongestDistinctString_Windows(text: String, distinct: Int) -> String {
    var map: [Character: Int] = [:]
    var startIndex = 0
    var endIndex = 0
    var counter = 0
    var maxLength = 0
    var maxStartIndex = 0
    let chars = Array(text)
    while endIndex < chars.count {
      let char = chars[endIndex]
      if map[char] == nil {
        map[char] = 1
      } else {
        map[char]! += 1
      }
      
      if map[char] == 1 {
        counter += 1
      }
      
      endIndex += 1
      
      while counter > distinct {
        let beginChar = chars[startIndex]
        map[beginChar]! -= 1
        if map[beginChar] == 0 {
          counter -= 1
        }
        startIndex += 1
      }
      
      if maxLength < endIndex - startIndex {
        maxLength = endIndex - startIndex
        maxStartIndex = startIndex
      }
    }
    let maxStringStartIndex = chars.index(maxStartIndex, offsetBy: 0)
    let maxStringEndIndex = chars.index(maxStartIndex, offsetBy: maxLength - 1)
    let maxString = chars[maxStringStartIndex...maxStringEndIndex].map{String($0)}.joined()
    return maxString
  }
}
