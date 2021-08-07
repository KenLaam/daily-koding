import UIKit

let node = Q3_20210807.Node(value: "root",
                            left: Q3_20210807.Node(value: "left", left: Q3_20210807.Node(value: "left.left")),
                            right: Q3_20210807.Node(value: "right"))

let serializedString = Q3_20210807.serialize(root: node)
print(serializedString)

if let deserializedNode = Q3_20210807.deserialize(string: serializedString) {
  print(deserializedNode.left?.left?.value)
  print(deserializedNode.right?.value)
  print(deserializedNode.right?.left?.value)
  print(Q3_20210807.serialize(root: deserializedNode))
}
