/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 // O(logn)
 */

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return -1
    }
    let minIndex = findMinIndex(nums: nums)
    let first = nums[0]
    if target == first {
        return 0
    }
    if target == nums[nums.count - 1] {
        return nums.count - 1
    }
    if nums[minIndex] == target {
        return minIndex
    }
    if minIndex == 0 {
        return binarySearch(nums: nums, target: target)
    }
    if target > first {
        let res = binarySearch(nums: Array(nums[0..<minIndex]), target: target)
        return res == -1 ? -1 : res
    }
    let res = binarySearch(nums: Array(nums[minIndex..<nums.count]), target: target)
    return res == -1 ? -1 : minIndex + res
}

func binarySearch(nums: [Int], target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    while start <=  end {
        let mid = start + (end - start) / 2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return -1
}

func findMinIndex(nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end {
        let mid = start + (end - start) / 2
        if nums[mid] < nums[end] {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return start
}


print(search([1,3,5], 3))
