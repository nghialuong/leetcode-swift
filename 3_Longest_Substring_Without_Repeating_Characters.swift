/*
 Given a string, find the length of the longest substring without repeating characters.

 Example 1:

 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    var dict = [Character: Int]()
    let chars = Array(s)
    var maxVal = 0
    var tempIndex = 0
    
    for i in 0..<chars.count {
        if let value = dict[chars[i]] {
            tempIndex = max(tempIndex, value + 1)
        }
        dict[chars[i]] = i
        maxVal = max(maxVal, i + 1 - tempIndex)
    }
    
    return maxVal
    
}

print(lengthOfLongestSubstring("pwwkew")) // "dvdf"

