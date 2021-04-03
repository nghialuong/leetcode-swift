
/*
 Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

  

 Example 1:

 Input: nums = [1,1,1], k = 2
 Output: 2
 Example 2:

 Input: nums = [1,2,3], k = 3
 Output: 2
  

 Constraints:

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107
 
 
 Time: O(n)
 */

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    
    var dict = [Int: Int]()
    dict[0] = 1
    
    var sum = 0
    var res = 0
    for num in nums {
        sum += num
        
        let need = sum - k
        if let val = dict[need] {
            res += val
        }
        if let val = dict[sum] {
            dict[sum] = val + 1
        } else {
            dict[sum] = 1
        }
    }
    
    return res
}

print(subarraySum([1,-1,0], 0))
