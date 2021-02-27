// Interative
// Time: O(n)
// Space: O(1)

func reverseList(_ head: ListNode?) -> ListNode? {
    guard head != nil else { return nil }
    
    var curr: ListNode? = head
    var prev: ListNode? = nil
    while curr != nil {
        let nextTemp = curr?.next
        curr?.next = prev
        prev = curr
        curr = nextTemp
    }
    
    return prev
}
