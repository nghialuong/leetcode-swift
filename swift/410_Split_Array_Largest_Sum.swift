/*
 Given an array which consists of non-negative integers and an integer m, you can split the array into m non-empty continuous subarrays. Write an algorithm to minimize the largest sum among these m subarrays.

 Note:
 If n is the length of array, assume the following constraints are satisfied:

 1 ≤ n ≤ 1000
 1 ≤ m ≤ min(50, n)
 Examples:

 Input:
 nums = [7,2,5,10,8]
 m = 2

 Output:
 18

 Explanation:
 There are four ways to split nums into two subarrays.
 The best way is to split it into [7,2,5] and [10,8],
 where the largest sum among the two subarrays is only 18.
 
 // O(n^m)
 */


import Foundation


class Solution {
    
    var ans = Int.max
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        dfs(nums: nums, arrayCount: 0, currentSum: 0, index: 0, m: m, currentMax: Int.min)
        return ans
    }

    func dfs(nums: [Int], arrayCount: Int, currentSum: Int, index: Int, m: Int, currentMax: Int) {
        if index == nums.count && arrayCount == m {
            ans = min(ans, currentMax)
            return
        }
        if index == nums.count {
            return
        }
        if index > 0 {
            dfs(nums: nums, arrayCount: arrayCount, currentSum: currentSum + nums[index], index: index + 1, m: m, currentMax: max(currentMax, currentSum + nums[index]))
        }
        if arrayCount < m {
            dfs(nums: nums, arrayCount: arrayCount + 1, currentSum: nums[index], index: index + 1, m: m, currentMax: max(currentMax, nums[index]))
        }
    }

}

let sol = Solution()
print(sol.splitArray([7,2,5,10,8], 2))
