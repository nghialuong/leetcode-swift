/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

 Example 1:

 Input: [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
              because they are adjacent houses.
 Example 2:

 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
              Total amount you can rob = 1 + 3 = 4.
 
 //
 O(n)
 */

import Foundation

func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    }
    return max(maxHouseRob(nums: Array(nums[0..<nums.count-1])), maxHouseRob(nums: Array(nums[1..<nums.count])))
}

func maxHouseRob(nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    }
    var dp = [Int](repeating: 0, count: nums.count+1)
    dp[0] = 0
    dp[1] = nums[0]
    for i in 1..<nums.count {
        dp[i+1] = max(dp[i-1] + nums[i], dp[i])
    }
    return dp[nums.count]
}

print(rob([2,3,2]))
