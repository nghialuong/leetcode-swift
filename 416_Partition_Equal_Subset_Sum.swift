/*
Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

Note:

Each of the array element will not exceed 100.
The array size will not exceed 200.
 

Example 1:

Input: [1, 5, 11, 5]

Output: true

Explanation: The array can be partitioned as [1, 5, 5] and [11].
 

Example 2:

Input: [1, 2, 3, 5]

Output: false

Explanation: The array cannot be partitioned into equal sum subsets.

*/

// Using Recursion & Memorization

func isSubset(_ nums: [Int], len: Int, sum: Int, memo: inout [String: Bool]) -> Bool {
    let key = "\(len)|\(sum)"
    if let value = memo[key] {
        return value
    }
    
    if sum == 0 {
        return true
    }
    
    if len == 0 && sum != 0 {
        return false
    }
    
    var isSubSet = false
    if nums[len-1] > sum {
        isSubSet = isSubset(nums, len: len-1, sum: sum, memo: &memo)
    } else {
        isSubSet = isSubset(nums, len: len-1, sum: sum, memo: &memo) || isSubset(nums, len: len-1, sum: sum-nums[len-1], memo: &memo)
        
    }
    memo[key] = isSubSet
    
    return isSubSet
}

func canPartition(_ nums: [Int]) -> Bool {
    var sum = 0
    for num in nums {
        sum += num
    }
    
    if sum % 2 != 0 {
        return false
    }
    
    var memo = [String: Bool]()
    
    return isSubset(nums, len: nums.count, sum: sum/2, memo: &memo)
}


print(canPartition([1,2,3]))

// using Dynamic programming

class Solution {
    
func canPartition(_ nums: [Int]) -> Bool {
 var sum = 0
    for num in nums {
        sum += num
    }
    
    if sum % 2 != 0 {
        return false
    }
    
    let n = sum / 2
    
    var dp = Array(repeating: Array(repeating: false, count: nums.count + 1), count: n + 1)
    for i in 0..<nums.count+1 {
        dp[0][i] = true
    }
    
    for i in 1..<n+1 {
        dp[i][0] = false
    }
    
    for i in 1..<n+1 {
        for j in 1..<nums.count+1 {
            dp[i][j] = dp[i][j-1]
            if i >= nums[j-1] {
                dp[i][j] = dp[i][j] || dp[i-nums[j-1]][j-1]
            }
        }
    }
    return dp[n][nums.count]
}
}
