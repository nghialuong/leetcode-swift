/*
 Given a sorted integer array without duplicates, return the summary of its ranges.

 Example 1:

 Input:  [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
 Example 2:

 Input:  [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.
 */

import Foundation

func summaryRanges(_ nums: [Int]) -> [String] {
    if nums.count == 0 {
        return []
    }
    
    var result = [String]()
    var startIndex = Int.min
    
    for i in 0..<nums.count {
        if i <= startIndex {
            continue
        }
        
        startIndex = i
        while startIndex + 1 < nums.count && (nums[startIndex+1] - nums[startIndex] == 1) {
            startIndex += 1
        }
    
        if nums[startIndex] != nums[i] {
            result.append("\(nums[i])->\(nums[startIndex])")
        } else {
            result.append("\(nums[i])")
        }
    }
    
    return result
}

print(summaryRanges([0,2,3,4,6,8,9]))
