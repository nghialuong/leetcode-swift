/*
 Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.

 Example 1:

 Input: "eceba"
 Output: 3
 Explanation: t is "ece" which its length is 3.
 Example 2:

 Input: "ccaabbb"
 Output: 5
 Explanation: t is "aabbb" which its length is 5.
 
 
 // 
 O(n)
 */


import Foundation

func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    
    var i = 0
    var j = 0
    let  chars = Array(s)
    var dict = [Character: Int]()
    var maxVal = 0
    while i < chars.count && j < chars.count {
        if dict.count > 2 {
            let charI = chars[i]
            if let charICount = dict[charI] {
                if charICount > 1 {
                    dict[charI] = charICount - 1
                } else {
                    dict.removeValue(forKey: charI)
                }
            }
            i += 1
        } else {
            let charJ = chars[j]
            if let charJCount = dict[charJ] {
                dict[charJ] = charJCount + 1
            } else {
                dict[charJ] = 1
            }
            
            if dict.count <= 2 {
                maxVal = max(maxVal, j - i + 1)
            }
            j += 1
        }
    }
    return maxVal
}

print(lengthOfLongestSubstringTwoDistinct("aabbbc"))
