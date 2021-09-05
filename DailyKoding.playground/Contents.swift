import Foundation

let text = "abbcccdddadqqqqqqqwxwwwww"
let distinct = 6
runningBlock("The longest substring with most distinct characters") {
  print(Q13_20210905.findLongestDistinctString(text: text, distinct: distinct))
}

runningBlock("The longest substring with most distinct characters - Sliding Windows") {
  print(Q13_20210905.findLongestDistinctString_Windows(text: text, distinct: distinct))
}
