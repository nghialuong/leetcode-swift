/*
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:
 
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 Output: [1,2,2,3,5,6]
 */

import Foundation

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    var index = nums1.count - 1
    while j >= 0 {
        if i < 0 || nums2[j] >= nums1[i] {
            nums1[index] = nums2[j]
            j -= 1
        } else if i >= 0 {
            nums1[index] = nums1[i]
            i -= 1
        }
        index -= 1
    }
}


var n1 = [2,0]
let n2 = [1]
print(merge(&n1, 1, n2, 1))

//[2,0]
//1
//[1]
//1
