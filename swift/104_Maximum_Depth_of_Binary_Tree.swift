/*
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
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

/*
 Solution: Recursion
 Time: O(n) - hit every node
 Space: O(log(n)) - in average case, when the tree is perfect balance
 */

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    let leftDepth = maxDepth(root?.left)
    let rightDepth = maxDepth(root?.right)
    return max(leftDepth, rightDepth) + 1
}

/* ====================== */


/*
 Solution: DFS interative
 Time: O(n) - hit every node
 Space: O(log(n)) - in average case, when the tree is perfect balance
 */

func maxDepth(_ root: TreeNode?) -> Int {
    
    guard var rootNode = root else {
        return 0
    }
    
    var stack = [TreeNode]()
    var depths = [Int]()
    depths.append(1)
    
    var depth = 0
    var current_depth = 0
    stack.append(rootNode)
    
    while !stack.isEmpty {
        rootNode = stack.popLast()!
        current_depth = depths.popLast()!
        depth = max(depth, current_depth)
        
        if let leftNode = rootNode.left {
            stack.append(leftNode)
            depths.append(current_depth + 1)
        }
        if let rightNode = rootNode.right {
            stack.append(rightNode)
            depths.append(current_depth + 1)
        }
    }
    
    return depth
}


var root = TreeNode(1)
root = TreeNode(4)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.right?.left = TreeNode(5)
root.right?.right = TreeNode(6)
root.right?.right?.left = TreeNode(8)
root.right?.left?.right = TreeNode(7)

print(maxDepth(root))

