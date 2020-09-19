/*
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    // find length of head
    var first = head
    var length = 0
    while first != nil {
        length += 1
        first = first?.next
    }
    
    length -= n
    let dummy = ListNode(0)
    dummy.next = head
    first = dummy
    while length > 0 {
        length -= 1
        first = first?.next
    }
    first?.next = first?.next?.next
    return dummy.next
}

let head = ListNode(10)
head.next = ListNode(1)
head.next?.next = ListNode(2)
head.next?.next?.next = ListNode(5)
head.next?.next?.next?.next = ListNode(7)

removeNthFromEnd(head, 2)

