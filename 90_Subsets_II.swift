/*
Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: [1,2,2]
Output:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]*/

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()
    let sortedNums = nums.sorted()
    helper(result: &result, tempList: &temp, nums: sortedNums, index: 0)
    return result
}

func helper(result: inout [[Int]], tempList: inout [Int], nums: [Int], index: Int) {
    result.append(tempList)
    if index >= nums.count {
        return
    }
    for i in index..<nums.count {
        if i > index && nums[i] == nums[i-1] {
            continue
        }
        tempList.append(nums[i])
        helper(result: &result, tempList: &tempList, nums: nums, index: i + 1)
        tempList.removeLast()
    }
}