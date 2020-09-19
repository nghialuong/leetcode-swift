/*
 Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

 Example 1:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
 Given tree t:
    4
   / \
  1   2
 Return true, because t has the same structure and node values with a subtree of s.
 Example 2:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
     /
    0
 Given tree t:
    4
   / \
  1   2
 Return false.
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if s == nil {
        return false
    }
    if isSameTree(s, t) {
        return true
    }
    return isSubtree(s?.left, t) || isSubtree(s?.right, t)
}

func isSameTree(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
    if t1 == nil && t2 == nil {
        return true
    }
    if t1 == nil || t2 == nil {
        return false
    }
    if t1?.val != t2?.val {
        return false
    }
    return isSameTree(t1?.left, t2?.left) && isSameTree(t1?.right, t2?.right)
}
