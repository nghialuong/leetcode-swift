/*
 https://leetcode.com/problems/trapping-rain-water/
 O(n^2)
 */

import Foundation

func trap(_ height: [Int]) -> Int {
    if height.count <= 2 {
        return 0
    }
    var total = 0
    for i in 0..<height.count {
        var maxLeft = 0
        for j in 0..<i {
            maxLeft = max(maxLeft, height[j])
        }
        var maxRight = 0
        for j in i+1..<height.count {
            maxRight = max(maxRight, height[j])
        }
        let minHeight = min(maxLeft, maxRight)
        if minHeight >= height[i] {
            total += minHeight - height[i]
        }
    }
    return total
}

// DP O(n)

func trap(_ height: [Int]) -> Int {
    if height.count <= 2 {
        return 0
    }
    let n = height.count
    var maxLeftArray = [Int](repeating: 0, count: n)
    var maxRightArray = [Int](repeating: 0, count: n)
    
    maxLeftArray[0] = height[0]
    for i in 1..<n {
        maxLeftArray[i] = max(maxLeftArray[i-1], height[i])
    }
    
    maxRightArray[n-1] = height[n-1]
    for i in (0..<n-1).reversed() {
        maxRightArray[i] = max(maxRightArray[i+1], height[i])
    }
    var total = 0
    for i in 1..<n {
        total += min(maxLeftArray[i], maxRightArray[i]) - height[i]
    }
    return total
}

print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
