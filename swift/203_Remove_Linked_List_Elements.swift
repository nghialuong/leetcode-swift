/*
 Remove all elements from a linked list of integers that have value val.

 Example:

 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
 
 Time: O(n)
 Space: O(1)
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

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    
    var current = head
    var prev = dummy // chu y thang nay, phai set no == dummy, thi moi set dc prev.next
    
    while current != nil {
        if current?.val == val {
            prev.next = current?.next
        } else {
            prev = current!
        }
        current = current?.next
    }
    
    return dummy.next
}
