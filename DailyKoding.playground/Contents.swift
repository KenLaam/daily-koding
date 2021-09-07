import Foundation

let orders = Q16_20210907.Orders()
let num = 10
for _ in 0..<num {
  orders.record(orderId: UUID().uuidString, total: Double.random(in: 1...(Double(num))))
}
orders.printAllOrders()
print(orders.getLast(i: 3)?.description ?? "")
