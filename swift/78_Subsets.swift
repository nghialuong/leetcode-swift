/*
Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]
*/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()
    helper(result: &result, tempList: &temp, nums: nums, index: 0)
    return result
}

func helper(result: inout [[Int]], tempList: inout [Int], nums: [Int], index: Int) {
    result.append(tempList)
    if index >= nums.count {
        return
    }
    for i in index..<nums.count {
        tempList.append(nums[i])
        helper(result: &result, tempList: &tempList, nums: nums, index: i + 1)
        tempList.removeLast()
    }
}
}