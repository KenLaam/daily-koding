import UIKit

let array = randomNumbers(length: 3000)
print(array.count)
print(array)
let total = randomNumber()
print(total)

measure {
  print(includeSumPair(in: array, total: total))
//  print(includeSumPairImproved(in: array, total: total))
}

