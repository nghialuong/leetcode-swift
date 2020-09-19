/*
 There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.

 The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.

 Note:
 All costs are positive integers.

 Example:

 Input: [[17,2,17],[16,16,5],[14,3,19]]
 Output: 10
 Explanation: Paint house 0 into blue, paint house 1 into green, paint house 2 into blue.
              Minimum cost: 2 + 5 + 3 = 10.
 
 O(2^n)
 */


import Foundation


class Solution {
    var memo = [String: Int]()
    
    func minCost(_ costs: [[Int]]) -> Int {
        if costs.count == 0 {
            return 0
        }
        return min(helper(index: 0, colorIndex: 0,costs: costs), min(helper(index: 0, colorIndex: 1, costs: costs), helper(index: 0, colorIndex: 2, costs: costs)))
    }
    
    func helper(index: Int, colorIndex: Int, costs: [[Int]]) -> Int {
        let key = "\(index) | \(colorIndex)"
        if let val = memo[key] {
            return val
        }
        var totalCost = costs[index][colorIndex]
        if index == costs.count - 1 {
            return totalCost
        }
        if colorIndex == 0 {
            totalCost += min(helper(index: index + 1, colorIndex: 1, costs: costs), helper(index: index + 1, colorIndex: 2, costs: costs))
        } else if colorIndex == 1 {
            totalCost += min(helper(index: index + 1, colorIndex: 0, costs: costs), helper(index: index + 1, colorIndex: 2, costs: costs))
        } else {
            totalCost += min(helper(index: index + 1, colorIndex: 1, costs: costs), helper(index: index + 1, colorIndex:0, costs: costs))
        }
        memo[key] = totalCost
        return totalCost
    }
    
}

let sol = Solution()
print(sol.minCost([[17,2,17],[16,16,5],[14,3,19]]))

// add DP

func minCost(_ costs: [[Int]]) -> Int {
    if costs.count == 0 {
        return 0
    }
    var clone = costs
    let n = costs.count
    for i in 1..<n {
        clone[i][0] += min(clone[i-1][1], clone[i-1][2])
        clone[i][1] += min(clone[i-1][0], clone[i-1][2])
        clone[i][2] += min(clone[i-1][1], clone[i-1][0])
    }
    return min(clone[n-1][0], min(clone[n-1][1], clone[n-1][2]))
}

