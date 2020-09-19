/*
 Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

 Example 1:

 Input: [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:

 Input: [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 
 Time: O(n)
 Space: O(1)
 */

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var maxVal = nums[0]
    var currentMax = nums[0]
    var currentMin = nums[0]
    for i in 1..<nums.count {
        let cMax = currentMax * nums[i]
        let cMin = currentMin * nums[i]
        currentMax = max(nums[i], max(cMax, cMin))
        currentMin = min(nums[i], min(cMax, cMin))
        maxVal = max(maxVal, currentMax)
    }
    return maxVal
}

print(maxProduct([-1, -1]))
