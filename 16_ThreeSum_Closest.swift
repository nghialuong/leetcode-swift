/*
Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

Example:

Given array nums = [-1, 2, 1, -4], and target = 1.

The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
*/

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else {
        return target
    } 

    let n = nums.sorted()
    var minDiff = Int.max   
    var minSum = Int.max   

    for i in 0..<n.count-2 {
        var lo = i + 1
        var hi = n.count - 1

        while lo < hi {
            let sum = n[i] + n[lo] + n[hi]
            let diff = abs(target - sum)
            minDiff = min(minDiff, diff)

            if (diff == minDiff) {
                minSum = sum
            }

            if sum == target {
                return sum     
            } 
            else if sum < target {
                lo += 1
            }
            else {
                 hi -= 1
            }
        }
    }

    return minSum
        
}

print(threeSumClosest([-1, -1, -1 , 2, 1, -4], 1))
