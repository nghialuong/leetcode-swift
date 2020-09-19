/*
 Given an array of strings arr. String s is a concatenation of a sub-sequence of arr which have unique characters.

 Return the maximum possible length of s.

  

 Example 1:

 Input: arr = ["un","iq","ue"]
 Output: 4
 Explanation: All possible concatenations are "","un","iq","ue","uniq" and "ique".
 Maximum length is 4.
 Example 2:

 Input: arr = ["cha","r","act","ers"]
 Output: 6
 Explanation: Possible solutions are "chaers" and "acters".
 Example 3:

 Input: arr = ["abcdefghijklmnopqrstuvwxyz"]
 Output: 26
  

 Constraints:

 1 <= arr.length <= 16
 1 <= arr[i].length <= 26
 arr[i] contains only lower case English letters.
 */

import Foundation

func maxLength(_ arr: [String]) -> Int {
    var maxLen = 0
    backtrack(index: 0, string: "", maxLen: &maxLen, in: arr)
    return maxLen
}

func backtrack(index: Int, string: String, maxLen: inout Int, in array: [String]) {
    maxLen = max(maxLen, string.count)
    if index == array.count {
        return
    }
    for i in index..<array.count {
        let combinedString = string + array[i]
        if isUniqueCharacters(combinedString) {
            backtrack(index: i + 1, string: combinedString, maxLen: &maxLen, in: array)
        }
    }
}

func isUniqueCharacters(_ s: String) -> Bool {
    var store = [Int](repeating: 0, count: 26)
    for c in Array(s) {
        let index = Int(c.asciiValue! - Character("a").asciiValue!)
        let val = store[index] + 1
        if val > 1 {
            return false
        }
        store[index] = val
    }
    return true
}

print(maxLength(["cha","r","act","ers"]))
