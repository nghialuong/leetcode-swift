/*
 Given two binary trees, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

 Example 1:

 Input:     1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 Output: true
 Example 2:

 Input:     1         1
           /           \
          2             2

         [1,2],     [1,null,2]

 Output: false
 Example 3:

 Input:     1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]
 
 Output: false
 */


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

func isIndentical(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }
    
    if node1 == nil || node2 == nil {
        return false
    }
    
    if node1?.val == node2?.val {
        return isIndentical(node1?.left, node2?.left) && isIndentical(node1?.right, node2?.right)
    }
    return false
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    return isIndentical(p, q)
}

var node1 = TreeNode(1)
node1.left = TreeNode(2)
node1.right = TreeNode(3)

var node2 = TreeNode(1)
node2.left = TreeNode(2)
//node2.right = TreeNode(3)

print(isSameTree(node1, node2)


