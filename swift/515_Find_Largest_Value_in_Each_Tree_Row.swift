/*
 You need to find the largest value in each row of a binary tree.

 Example:
 Input:

           1
          / \
         3   2
        / \   \
       5   3   9

 Output: [1, 3, 9]
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func largestValues(_ root: TreeNode?) -> [Int] {
    var res = [Int]()
    helper(root, level: 0, result: &res)
    return res
}

func helper(_ node: TreeNode?, level: Int, result: inout [Int]) {
    if node == nil {
        return
    }
    if level == result.count {
        result.append(node!.val)
    } else {
        result.insert(max(result[level], node!.val), at: level)
    }
    helper(node?.left, level: level + 1, result: &result)
    helper(node?.right, level: level + 1, result: &result)
}
