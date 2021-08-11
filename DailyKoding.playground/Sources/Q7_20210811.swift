import Foundation

/// Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.
///
/// For example, the message '111' would give 3, since it could be decoded as 'aaa', 'ka', and 'ak'.
///
/// You can assume that the messages are decodable. For example, '001' is not allowed.

public class Q7_20210811: NSObject {
  
  public static func countDecodeMessages(_ message: String) -> Int {
    let length = message.count
    guard length > 0 else { return 0 }
    var count = 0
    
    let firstChar = Int(String(Array(message)[0])) ?? 0
    
    if firstChar > 0 {
      if length == 1 {
        return 1
      } else {
        count += countDecodeMessages(String(message.dropFirst()))
      }
    } else {
      return 0
    }
    
    let secondChar = Int(String(Array(message)[1])) ?? 0
    
    if firstChar * 10 + secondChar <= 26 {
      if length == 2 {
        count += 1
      } else {      
        count += countDecodeMessages(String(message.dropFirst(2)))
      }
    }
    
    return count
  }
}
