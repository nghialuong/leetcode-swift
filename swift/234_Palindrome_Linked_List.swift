/*
Given a singly linked list, determine if it is a palindrome.

Example 1:

Input: 1->2
Output: false
Example 2:

Input: 1->2->2->1
Output: true
Follow up:
Could you do it in O(n) time and O(1) space?
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
      if head == nil {
        return true
    }
    
    if head?.next == nil {
        return true
    }
    
    var array = [Int]()
    
    var node = head
    while node != nil {
        if let value = node?.val {
            array.append(value)
        }
        node = node?.next
    }
    
    for i in 0..<array.count {
        if array[i] != array[array.count - 1 - i] {
            return false
        }
    }
    return true

    }
}