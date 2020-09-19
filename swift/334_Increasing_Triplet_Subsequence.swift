/*
 Given an unsorted array return whether an increasing subsequence of length 3 exists or not in the array.

 Formally the function should:

 Return true if there exists i, j, k
 such that arr[i] < arr[j] < arr[k] given 0 ≤ i < j < k ≤ n-1 else return false.
 Note: Your algorithm should run in O(n) time complexity and O(1) space complexity.

 Example 1:

 Input: [1,2,3,4,5]
 Output: true
 Example 2:

 Input: [5,4,3,2,1]
 Output: false
 */

func increasingTriplet(_ nums: [Int]) -> Bool {
    if nums.count == 0 {
        return false
    }
    
    var n1 = Int.max
    var n2 = Int.max
    
    for n in nums {
        if n <= n1 {
            n1 = n // set min
        } else if n <= n2 {
            n2 = n // set middle
        } else {
            return true // has max
        }
    }
    return false
}
