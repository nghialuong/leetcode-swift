/*
 Given an integer array, find three numbers whose product is maximum and output the maximum product.

 Example 1:

 Input: [1,2,3]
 Output: 6
  

 Example 2:

 Input: [1,2,3,4]
 Output: 24
  

 Note:

 The length of the given array will be in range [3,104] and all elements are in the range [-1000, 1000].
 Multiplication of any three numbers in the input won't exceed the range of 32-bit signed integer.

 ===
 
 Time: O(nlogn)
 Space: O(logn)
 */

import Foundation

func maximumProduct(_ nums: [Int]) -> Int {
    let n = nums.count
    let sortedNums = nums.sorted()
    return max(sortedNums[n-3] * sortedNums[n-2] * sortedNums[n-1], sortedNums[0] * sortedNums[1] * sortedNums[n-1])
}

print(maximumProduct([2, 2, 2]))
