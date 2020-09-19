/*
 https://leetcode.com/problems/copy-list-with-random-pointer/
 */

import Foundation

public class Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val
    }
    
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

func copyRandomList(_ head: Node?) -> Node? {
    var visitied = [Node: Node]()
    return copy(head: head, visited: &visitied)
}

func copy(head: Node?, visited: inout [Node: Node]) -> Node? {
    guard let head = head else {
        return nil
    }
    if let visitedHead = visited[head] {
        return visitedHead
    }
    
    let cloneNode = Node(head.val)
    visited[head] = cloneNode
    
    cloneNode.next = copy(head: head.next, visited: &visited)
    cloneNode.random = copy(head: head.random, visited: &visited)
    
    return cloneNode
}
