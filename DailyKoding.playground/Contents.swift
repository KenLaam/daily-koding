import Foundation

let root = Q8_20210812.TreeNode(0,
                                Q8_20210812.TreeNode(1),
                                Q8_20210812.TreeNode(0,
                                                     Q8_20210812.TreeNode(1,
                                                                          Q8_20210812.TreeNode(1),
                                                                          Q8_20210812.TreeNode(0)),
                                                     Q8_20210812.TreeNode(0)))
Q8_20210812.countUnivalTree(root)
