/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).

 Find the minimum element.

 You may assume no duplicate exists in the array.

 Example 1:

 Input: [3,4,5,1,2]
 Output: 1
 Example 2:

 Input: [4,5,6,7,0,1,2]
 Output: 0
 */

import Foundation

func findMin(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end {
        let mid = start + (end - start) / 2
        if nums[mid] < nums[end] {
            end = mid // not mid + 1 cus num[mid] still valid, it might be the smallest
        } else {
            start = mid + 1 // nums[start] > nums[mid], so num[start] is not smallest
        }
    }
    return nums[start]
}

print(findMin([4,5,6,7,10,1,2]))
