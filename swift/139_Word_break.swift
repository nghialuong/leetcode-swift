/*
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note:

 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 Example 1:

 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
              Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 */

/*
 Solution: DP
 Time: O(n^3)
 */
 
 func wordBreak(_ s: String, _ words: [String]) -> Bool {
    var dp = Array(repeating: false, count: s.count+1)
    dp[0] = true
    
    for i in 1..<s.count+1 {
        for j in (0..<i).reversed() {
            if dp[j] && words.contains(sub) {
                dp[i] = true
                break
            }
        }
    }
    return dp[s.count]
 }
 
 func contain(_ s: String, in source: String, start: Int, end: Int) -> Bool {
    let mainChars = Array(source)
    let subChars = Array(s)
    var subCount = 0
    for i in start..<end {
        if mainChars[i] != subChars[subCount] {
            return false
        }
        subCount += 1
    }
    return true
 }
 
 func subString(_ s: String, start: Int, len: Int) -> String {
     let from = s.index(s.startIndex, offsetBy: start)
     let to = s.index(s.endIndex, offsetBy: -(s.count - start - len))
     let sub = s[from..<to]
     return String(sub)
 }

 
 print(wordBreak("a", ["a"]))


/*
Solution: Bruce Force
Time: O(2^n)
 
*/

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    return backtrack(s, dict: Set(wordDict), startIdx: 0)
}

func backtrack(_ s: String, dict: Set<String>, startIdx: Int) -> Bool {
    if startIdx == s.count {
        return true
    }
    
    for endIdx in startIdx + 1 ... s.count {
        let str = s.substring(startIndex: startIdx, endIndex: endIdx)
        if dict.contains(str) {
            if backtrack(s, dict: dict, startIdx: endIdx) {
                return true
            }
        }
    }
    
    return false
}

extension String {
    func substring(startIndex: Int, endIndex: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: startIndex)
        let end = self.index(self.startIndex, offsetBy: endIndex)
        let subString = self[start..<end]
        return String(subString)
    }
}

let dict = ["leet", "code"]
print(wordBreak("leetcodea", dict))
