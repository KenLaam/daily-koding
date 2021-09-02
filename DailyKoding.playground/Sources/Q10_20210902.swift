import Foundation

/// Implement a job scheduler which takes in a function f and an integer n, and calls f after n milliseconds.

public class Q10_20210902: NSObject {
  public static func delayJob(ms delayTime: Int) {
    if delayTime == 0 {
      print("Bye")
      print(Date().timeIntervalSince1970)
      return
    }
    
    print("Hello")
    print(Date().timeIntervalSince1970)
    Thread.sleep(forTimeInterval: Double(delayTime)/1000)
    delayJob(ms: 0)
  }
}
