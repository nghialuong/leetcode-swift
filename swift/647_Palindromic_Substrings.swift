/*
 Given a string, your task is to count how many palindromic substrings in this string.

 The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

 Example 1:

 Input: "abc"
 Output: 3
 Explanation: Three palindromic strings: "a", "b", "c".
  

 Example 2:

 Input: "aaa"
 Output: 6
 Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
  

 Note:

 The input string length won't exceed 1000.
 */

func countSubstrings(_ s: String) -> Int {
    
    if s.count == 0 {
        return 0
    }
    
    if s.count == 1 {
        return 1
    }
    
    var counter = 0
    let chars = Array(s)
    
    var memory = [String: Bool]()
    
    for i in 0..<s.count { // aaa
        for j in i..<s.count {
            
            let key = "\(i)|\(j)"
            if memory[key] != nil {
                continue
            }
            memory[key] = true
            
            if j - i + 1 >= 2 {
                var l = i
                var h = j
                var isPalin = true
                while l <= h {
                    if chars[l] != chars[h] {
                        isPalin = false
                        break
                    }
                    l += 1
                    h -= 1
                }
                
                if isPalin {
                    counter += 1
                }
            }
            else {
                counter += 1
            }
        }
    }
    
    return counter
}

print(countSubstrings("xkjkqlajprjwefilxgpdpebieswu"))
