/*
 Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.
 
 Examples:
 
 s = "leetcode"
 return 0.
 
 s = "loveleetcode",
 return 2.
 Note: You may assume the string contain only lowercase letters.
 */

import Foundation

func firstUniqChar(_ s: String) -> Int {
    if s.count == 0 {
        return -1
    }
    if s.count == 1 {
        return 0
    }
    
    var freq = [Int](repeating: 0, count: 26)
    let chars = Array(s)
    for char in chars {
        freq[Int(char.asciiValue!) - Int(Character("a").asciiValue!)] += 1
    }
    
    for i in 0..<chars.count {
        if freq[Int(chars[i].asciiValue!) - Int(Character("a").asciiValue!)] == 1 {
            return i
        }
    }
    
    return -1
}

print(firstUniqChar("leetcode"))
