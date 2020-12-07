/*
 
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 
 ---
 
 Time: O(n)
 Space: O(1)
 
 */

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var zeroIdx = 0
    
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums[zeroIdx] = nums[i]
            zeroIdx += 1
        }
    }
    
    for i in zeroIdx..<nums.count {
        nums[i] = 0
    }
}

var nums = [3,2,1,4,0,2,0,1,1]
print(moveZeroes(&nums))
