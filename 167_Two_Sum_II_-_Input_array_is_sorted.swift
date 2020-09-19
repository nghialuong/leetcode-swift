import Foundation

/*
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

 Note:

 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 Example:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 
 // using two pointers
 // O(n)
 */

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    if numbers.count < 2 {
        return []
    }
    var i = 0
    var j = numbers.count - 1
    while i < j {
        let sum = numbers[i] + numbers[j]
        if sum == target {
            return [i+1, j+1]
        } else if sum < target {
            i += 1
        } else {
            j -= 1
        }
    }
    return []
}

print(twoSum([2,3,4], 6))
