/*
 Given a set of distinct positive integers, find the largest subset such that every pair (Si, Sj) of elements in this subset satisfies:

 Si % Sj = 0 or Sj % Si = 0.

 If there are multiple solutions, return any subset is fine.

 Example 1:

 Input: [1,2,3]
 Output: [1,2] (of course, [1,3] will also be ok)
 Example 2:

 Input: [1,2,4,8]
 Output: [1,2,4,8]
 
 
 */


import Foundation
// Backtraking

class Solution {
    var result = [Int]()
    
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var seq = [Int]()
        let sortedNums = nums.sorted()
        var lenMemo = [Int](repeating: -1, count: nums.count)
        helper(nums: sortedNums, index: 0, prevVal: 1, seq: &seq, lenMemo: &lenMemo)
        return result
    }
    
    func helper(nums: [Int], index: Int, prevVal: Int, seq: inout [Int], lenMemo: inout [Int]) {
        if seq.count > result.count {
            result = seq
        }
        for i in index..<nums.count {
            if seq.count > lenMemo[i] &&  nums[i] % prevVal == 0 {
                lenMemo[i] = seq.count
                seq.append(nums[i])
                helper(nums: nums, index: i + 1, prevVal: nums[i], seq: &seq, lenMemo: &lenMemo)
                seq.removeLast()
            }
        }
    }
}

let sol = Solution()
print(sol.largestDivisibleSubset([1,2,4,8, 9]))

// DP O(n^2)

func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    let sortedNums = nums.sorted()
    let n = nums.count
    var dp = [Int](repeating: -1, count: n)
    dp[n-1] = 1
    
    for i in (0..<n-1).reversed() {
        var maxVal = 0
        for j in i+1..<n {
            if sortedNums[j] % sortedNums[i] == 0 {
                if maxVal < dp[j] {
                    maxVal = dp[j]
                }
            }
        }
        dp[i] = 1 + maxVal
    }
    
    let maxLen = dp.sorted().last!
    var res = [Int]()
    var count = maxLen
    var startIndex = 0
    while count > 0 {
        let foundIndex = findIndexOf(k: count, nums: dp, from: startIndex)
        if foundIndex != -1 {
            startIndex = foundIndex
            res.append(sortedNums[foundIndex])
        }
        count -= 1
    }
    return res
}

func findIndexOf(k: Int, nums: [Int], from: Int) -> Int {
    for i in from..<nums.count {
        if nums[i] == k {
            return i
        }
    }
    return -1
}

