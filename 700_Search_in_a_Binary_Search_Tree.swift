

/*
 Given the root node of a binary search tree (BST) and a value. You need to find the node in the BST that the node's value equals the given value. Return the subtree rooted with that node. If such node doesn't exist, you should return NULL.

 For example,

 Given the tree:
         4
        / \
       2   7
      / \
     1   3

 And the value to search: 2
 You should return this subtree:

       2
      / \
     1   3
 In the example above, if we want to search the value 5, since there is no node with value 5, we should return NULL.

 Note that an empty tree is represented by NULL, therefore you would see the expected output (serialized tree format) as [], not null.
 
 // O(H) - H is height of tree.
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

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        return search(root: root, target: val)
    }
    
    func search(root: TreeNode?, target: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if target == root.val {
            return root
        } else if target < root.val {
            return search(root: root.left, target: target)
        } else {
            return search(root: root.right, target: target)
        }
    }
}
