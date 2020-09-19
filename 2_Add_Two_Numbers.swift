import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        next = nil
    }
}

let node1 = ListNode(2)
node1.next = ListNode(4)
node1.next?.next = ListNode(3)

let node2 = ListNode(5)
node2.next = ListNode(6)
node2.next?.next = ListNode(4)

func display(_ node: ListNode?) {
    var ln = node
    while ln != nil {
        print(ln?.val ?? 0)
        ln = ln?.next
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil, l2 != nil else { return nil }
    
    var n1 = l1
    var n2 = l2
    var carry = 0
    var node = ListNode(0)

    while n1 != nil || n2 != nil {
        var sum = 0
        if let val1 = n1?.val {
            sum += val1
        }

        if let val2 = n2?.val {
            sum += val2
        }
        sum += carry

        node.next = ListNode(sum % 10)
        carry = sum / 10
        
        n1 = n1?.next
        n2 = n2?.next
        
        if let next = node.next {
            node = next
        }

    }

    if carry == 1 {
        node.next = ListNode(1)
    }

    return node.next

}

display(addTwoNumbers(node1, node2))



