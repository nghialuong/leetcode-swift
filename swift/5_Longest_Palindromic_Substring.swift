/*
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
Example 2:

Input: "cbbd"
Output: "bb"
*/

/* // Around center 0(n^2)

 func longestPalindrome(_ s: String) -> String {
     let chars = Array(s)
     if s.count <= 1 {
         return s
     }
     var startIndex = 0
     var endIndex = 0
     for i in 0..<chars.count {
         let len1 = countLen(chars: chars, from: i, to: i)
         let len2 = countLen(chars: chars, from: i, to: i+1)
         let maxLen = max(len1, len2)
         if maxLen > endIndex - startIndex {
             if maxLen % 2 == 0 {
                 startIndex = i - maxLen / 2 + 1
             } else {
                 startIndex = i - maxLen / 2
             }
             endIndex = i + maxLen / 2
         }
     }
     return substring(chars: chars, from: startIndex, to: endIndex)
 }

 func countLen(chars: [Character], from: Int, to: Int) -> Int {
     var f = from
     var t = to
     while f >= 0 && t < chars.count {
         if chars[f] != chars[t] {
             break
         }
         f -= 1
         t += 1
     }
     return t - f - 1
 }

 func substring(chars: [Character], from: Int, to: Int) -> String {
     if from > to {
         return ""
     }
     var result = ""
     for i in from..<to+1 {
         result += String(chars[i])
     }
     return result
 }


 print(longestPalindrome("ac"))


*/

// Using DP

func longestPalindrome(_ s: String) -> String {
    let chars = Array(s)
    let n = s.count
    if n == 0 {
        return ""
    }
    if n == 1 {
        return s
    }
    
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    var maxVal = 0
    var startIndex = 0
    for i in 0..<n {
        dp[i][i] = true
        startIndex = i
        maxVal = 1
    }
        
    for i in 0..<n-1 {
        if chars[i] == chars[i+1] {
            dp[i][i+1] = true
            startIndex = i
            maxVal = 2
        }
    }
    
    for k in 3..<n+1 {
        for i in 0..<n-k+1 {
            let j = i + k - 1
            if dp[i+1][j-1] == true && chars[i] == chars[j] {
                dp[i][j] = true
                if k > maxVal {
                    startIndex = i
                    maxVal = k
                }
            }
        }
    }
    return substring(s: s, from: startIndex, to: startIndex + maxVal)
}

func substring(s: String, from: Int, to: Int) -> String {
    if from > to {
        return ""
    }
    let chars = Array(s)
    var resut = [Character]()
    for i in from..<to {
        resut.append(chars[i])
    }
    return String(resut)
}

print(longestPalindrome(""))
