/*
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
   [7],
   [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 
 //
 Time Complexity: O(2^n)
 */

import Foundation

/*
 
 // backtrack
 
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()
    helper(result: &result, tempList: &temp, candidates: candidates, index: 0, target: target)
    return result
}

func helper(result: inout [[Int]], tempList: inout [Int], candidates: [Int], index: Int, target: Int) {
    if target == 0 {
        result.append(tempList)
        return
    }
    if target < 0 || index >= candidates.count {
        return
    }
    tempList.append(candidates[index])
    helper(result: &result, tempList: &tempList, candidates: candidates, index: index, target: target - candidates[index])
    tempList.removeLast()
    helper(result: &result, tempList: &tempList, candidates: candidates, index: index + 1, target: target)
}

print(combinationSum([2,3,6,7], 7))
 
 */


// Backtrack with DFS

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()
    helper(result: &result, tempList: &temp, candidates: candidates, index: 0, target: target)
    return result
}

func helper(result: inout [[Int]], tempList: inout [Int], candidates: [Int], index: Int, target: Int) {
    if target == 0 {
        result.append(tempList)
        return
    }
    if target < 0 || index >= candidates.count {
        return
    }
    for i in index..<candidates.count {
        tempList.append(candidates[i])
        helper(result: &result, tempList: &tempList, candidates: candidates, index: i, target: target - candidates[i])
        tempList.removeLast()
    }
}

print(combinationSum([2,3,6,7], 7))
