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
  Time: O(n)
  */
 
 func bfs(_ root: TreeNode?) {
    
    guard let root = root else { return }
    
    var queue = [TreeNode]()
    queue.append(root)
    
    while queue.isEmpty == false {
        let node = queue.first!
        queue.removeFirst()
        
        print(node.val)
        
        if let left = node.left {
            queue.append(left)
        }
        
        if let right = node.right {
            queue.append(right)
        }
    }
    
 }
 
 
 let root = TreeNode(1)
 root.left = TreeNode(2)
 root.left!.left = TreeNode(4)
 root.right = TreeNode(5)
  
 print(bfs(root))
