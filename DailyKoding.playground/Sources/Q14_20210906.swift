import Foundation

/// The area of a circle is defined as πr^2. Estimate π to 3 decimal places using a Monte Carlo method.
///
/// Hint: The basic equation of a circle is x^2 + y^2 = r^2.

public class Q14_20210906 {
  public static func calculatePi(n: Int) -> String {
    var x, y: Double
    var count = 0
    
    for _ in 0..<n*n {
      x = Double.random(in: -1...1)
      y = Double.random(in: -1...1)
      
      if x*x + y*y <= 1 {
        count += 1
      }
    }
    let pi = 4.0 * Double(count)/Double(n*n)
    return String(format: "%.3f", pi)
  }
}
