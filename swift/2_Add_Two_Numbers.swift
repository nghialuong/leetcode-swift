/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */

/*
 - Time Complexity: O(max(m,n))
 - Space Complexity: O(max(m,n) + 1)
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

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var n1 = l1
        var n2 = l2
        var carry = 0
        let node = ListNode(0)
        var currentNode = node
        
        while n1 != nil || n2 != nil {
            var sum = 0
            if let val1 = n1?.val {
                sum += val1
            }
            
            if let val2 = n2?.val {
                sum += val2
            }
            sum += carry
            
            currentNode.next = ListNode(sum % 10)
            carry = sum / 10
            
            n1 = n1?.next
            n2 = n2?.next
            
            if let next = currentNode.next {
                currentNode = next
            }
            
        }
        
        if carry == 1 {
            currentNode.next = ListNode(1)
        }
        
        return node.next
    }
    
}
