/*
 
 Given an array of integers nums.

 A pair (i,j) is called good if nums[i] == nums[j] and i < j.

 Return the number of good pairs.

  

 Example 1:

 Input: nums = [1,2,3,1,1,3]
 Output: 4
 Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
 Example 2:

 Input: nums = [1,1,1,1]
 Output: 6
 Explanation: Each pair in the array are good.
 Example 3:

 Input: nums = [1,2,3]
 Output: 0
 
 */

/*
 Using math.
 Time: O(n)
 */

func numIdenticalPairs(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    var mem = [Int: Int]()
    var res = 0
    
    for num in nums {
        if let val = mem[num] {
            let newVal = val + 1
            res += newVal
            mem[num] = newVal
        } else {
            mem[num] = 0
        }
    }
    
    return res
 }
 
 print(numIdenticalPairs([1,1,1,1]))
