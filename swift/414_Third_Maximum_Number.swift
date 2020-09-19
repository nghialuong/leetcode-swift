/*
 Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).
 
 Example 1:
 Input: [3, 2, 1]
 
 Output: 1
 
 Explanation: The third maximum is 1.
 Example 2:
 Input: [1, 2]
 
 Output: 2
 
 Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
 Example 3:
 Input: [2, 2, 3, 1]
 
 Output: 1
 
 Explanation: Note that the third maximum here means the third maximum distinct number.
 Both numbers with value 2 are both considered as second maximum.
 */

import Foundation

func thirdMax(_ nums: [Int]) -> Int {
    let sortedArray = nums.sorted()
    var counter = 1
    var res = 0
    for i in  (0..<sortedArray.count).reversed() {
        if i < 1 {
            break
        }
        if sortedArray[i] != sortedArray[i-1] {
            counter += 1
            res = sortedArray[i-1]
        }
        
        if counter > 2 {
            break
        }
    }
    if counter < 3 {
        return sortedArray[sortedArray.count - 1]
    }
    return res
}

print(thirdMax([1,2,2,5,3,5]))
