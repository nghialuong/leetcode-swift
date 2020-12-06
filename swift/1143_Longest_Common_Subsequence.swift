/*
 Given two strings text1 and text2, return the length of their longest common subsequence.

 A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

  

 If there is no common subsequence, return 0.

  

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
  

 Constraints:

 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 The input strings consist of lowercase English characters only.
 */

 /*
 Solution: DP
 - Time complexcity: O(m*n)
 - Space complexcity: O(m*n) - make a 2D array to store dp
 */


func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

    let chars1 = Array(text1)
    let chars2 = Array(text2)
    var table = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)

    for i in 0..<chars1.count+1 {
        for j in 0..<chars2.count+1 {
            if i == 0 || j == 0 {
                table[i][j] = 0
            }
            else if chars1[i-1] == chars2[j-1] {
                table[i][j] = 1 + table[i-1][j-1]
            }
            else {
                table[i][j] = max(table[i][j-1],
                                  table[i-1][j])
            }
        }
    }
    return table[chars1.count][chars2.count]
    
}

print(longestCommonSubsequence("abcde", "ace"))
