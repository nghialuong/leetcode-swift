/*
 https://leetcode.com/problems/clone-graph/
 Time: O(n)
 */

import Foundation

public class Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
    
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    var visited = [Node: Node]()
    return clone(node, visited: &visited)
}

func clone(_ node: Node?, visited: inout Dictionary<Node, Node>) -> Node? {
    guard let node = node else {
        return nil
    }
    if let savedNode = visited[node] {
        return savedNode
    }
    
    let cloneNode = Node(node.val)
    visited[node] = cloneNode
    
    for nNode in node.neighbors {
        cloneNode.neighbors.append(clone(nNode, visited: &visited))
    }
    
    return cloneNode
}

