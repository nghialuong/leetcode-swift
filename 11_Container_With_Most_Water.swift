/*
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 
 //
 
 Time: O(n+m)
 Spaece: O(1)
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil {
        return nil
    }
    if l1 == nil {
        return l2
    }
    if l2 == nil {
        return l1
    }
    
    let dummy = ListNode(0)
    var node = dummy
    var node1 = l1
    var node2 = l2
    while node1 != nil || node2 != nil {
        if let val1 = node1?.val, let val2 = node2?.val {
            if val1 <= val2 {
                node.next = node1
                node1 = node1?.next
            } else {
                node.next = node2
                node2 = node2?.next
            }
            node = node.next!
            continue
        }
        
        if (node1?.val) != nil {
            node.next = node1
            node1 = node1?.next
            node = node.next!
        }
        
        if (node2?.val) != nil {
            node.next = node2
            node2 = node2?.next
            node = node.next!
        }
        
    }
    return dummy.next
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(4)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

mergeTwoLists(l1, l2)
