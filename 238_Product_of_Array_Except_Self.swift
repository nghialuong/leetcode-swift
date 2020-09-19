/*
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].

 Example:

 Input:  [1,2,3,4]
 Output: [24,12,8,6]
 Constraint: It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.

 Note: Please solve it without division and in O(n).

 Follow up:
 Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
 */

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var ans = [Int](repeating: 0, count: n)
    var left = [Int](repeating: 0, count: n)
    var right = [Int](repeating: 0, count: n)
    
    left[0] = 1
    for i in 1..<n {
        left[i] = left[i-1] * nums[i-1]
    }
    
    right[n-1] = 1
    for j in (0..<n-1).reversed() {
        right[j] = right[j+1] * nums[j+1]
    }
        
    for i in 0..<n {
        ans[i] = left[i] * right[i]
    }
    return ans
}

print(productExceptSelf([1,2,3,4]))


