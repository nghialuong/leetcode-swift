/*
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 Each number in candidates may only be used once in the combination.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 Example 2:
 
 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
 [1,2,2],
 [5]
 ]
 */

import Foundation

// Backtrack with Set

/*
 func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
 var resultSet = Set<[Int]>()
 var temp = [Int]()
 let sortedCandidates = candidates.sorted()
 helper(result: &resultSet, tempList: &temp, candidates: sortedCandidates, index: 0, target: target)
 return Array(resultSet)
 }
 
 func helper(result: inout Set<[Int]>, tempList: inout [Int], candidates: [Int], index: Int, target: Int) {
 if target == 0 {
 result.insert(tempList)
 return
 }
 if target < 0 || index >= candidates.count {
 return
 }
 tempList.append(candidates[index])
 helper(result: &result, tempList: &tempList, candidates: candidates, index: index + 1, target: target - candidates[index])
 tempList.removeLast()
 helper(result: &result, tempList: &tempList, candidates: candidates, index: index + 1, target: target)
 }
 
 */

// DFS

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()
    let sortedCandidates = candidates.sorted()
    helper(result: &result, tempList: &temp, candidates: sortedCandidates, index: 0, target: target)
    return result
}

func helper(result: inout [[Int]], tempList: inout [Int], candidates: [Int], index: Int, target: Int) {
    if target == 0 {
        result.append(tempList)
        return
    }
    if target < 0 {
        return
    }
    for i in index..<candidates.count {
        if i > index && candidates[i] == candidates[i-1] { // trong 1 cai loop, thi no take thang dau tien, thang thu 2 tro di ko take nua, the nen moi fai sort trc
            continue
        }
        tempList.append(candidates[i])
        helper(result: &result, tempList: &tempList, candidates: candidates, index: i + 1, target: target - candidates[i])
        tempList.removeLast()
    }
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
