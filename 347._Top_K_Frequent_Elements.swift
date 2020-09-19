/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:
 
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */


import Foundation

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count < 1 {
        return []
    }
    
    var table = [Int: Int]()
    for i in 0..<nums.count {
        let key = nums[i]
        if var value = table[key] {
            value += 1
            table[key] = value
        } else {
            table[key] = 1
        }
    }
    
    let sortedNUms = table.keys.sorted {
        return table[$0]! > table[$1]!
    }
    
    return Array(sortedNUms[0..<k])
}

