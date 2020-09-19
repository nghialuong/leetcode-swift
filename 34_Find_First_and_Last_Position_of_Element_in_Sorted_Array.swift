/*
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 Your algorithm's runtime complexity must be in the order of O(log n).

 If the target is not found in the array, return [-1, -1].

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count < 1 {
        return [-1, -1]
    }
    
    let foundIndex = find(nums, target)
    if foundIndex == -1 {
        return [-1, -1]
    }
    let foundNum = nums[foundIndex]
    var i = foundIndex
    var j = foundIndex+1
    while i >= 0 {
        if nums[i] == foundNum {
            i -= 1
        } else {
            break
        }
    }
    while j < nums.count {
        if nums[j] == foundNum {
            j += 1
        } else {
            break
        }
    }
    
    return [i+1, j-1]
}

func find(_ nums: [Int], _ target: Int) -> Int {
    var idx = -1
    var start = 0
    var end = nums.count-1
    while start <= end {
        let mid = start + (end - start) / 2
        if nums[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
        if nums[mid] == target {
            idx = mid
        }
    }
    return idx
}

let nums = [1]
print(searchRange(nums, 1))

