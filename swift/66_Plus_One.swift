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

func plusOne(_ digits: [Int]) -> [Int] {
    var nums = digits
    for i in (0..<digits.count).reversed() {
        if digits[i] < 9 {
            nums[i] += 1
            return nums
        }
        nums[i] = 0
    }
    var newNums = [Int]()
    newNums.append(1)
    for num in nums {
        newNums.append(num)
    }
    
    return newNums
}

print(plusOne([9, 9, 9 , 9]))
