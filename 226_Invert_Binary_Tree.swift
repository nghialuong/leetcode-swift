
/*
 nvert a binary tree.

 Example:

 Input:

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 Output:

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 Trivia:
 This problem was inspired by this original tweet by Max Howell:

 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return nil
    }
    return swapNode(node: root)
}

func swapNode(node: TreeNode?) -> TreeNode? {
    if node == nil {
        return nil
    }
    
    let left = swapNode(node: node?.left)
    let right = swapNode(node: node?.right)
    let newNode = TreeNode(node!.val)
    newNode.left = right
    newNode.right = left
    return newNode
}
