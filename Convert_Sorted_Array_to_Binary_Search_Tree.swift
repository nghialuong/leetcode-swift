/*
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted array: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
 0
 / \
 -3   9
 /   /
 -10  5
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

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0 {
        return nil
    }
    return sorted(nums, start: 0, end: nums.count - 1)
}

func sorted(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
    if start > end {
        return nil
    }
    let mid = start + (end - start) / 2
    let root = TreeNode(mid)
    root.left = sorted(nums, start: 0, end: mid - 1)
    root.right = sorted(nums, start: mid + 1, end: end)
    return root
}
