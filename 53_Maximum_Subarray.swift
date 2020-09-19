/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var currentMax = nums[0]
    var maxVal = currentMax
    for i in 1..<nums.count {
        currentMax = max(nums[i], currentMax + nums[i])
        maxVal = max(currentMax, maxVal)
    }
    return maxVal
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
