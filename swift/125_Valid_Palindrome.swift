/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
 */

import  Foundation

func isPalindrome(_ s: String) -> Bool {
    if s.count <= 1 {
        return true
    }
    var result = [Character]()
    for c in Array(s) {
        if let value = c.asciiValue {
            if (value >= 97 && value <= 122) ||
                (value >= 48 && value <= 57) {
                result.append(c)
            }
            if (value >= 65 && value <= 90) {
                result.append(Character(UnicodeScalar(value + 32))) // 97 - 65
            }
        }
    }
    
    print(String(result))
    
    for i in 0..<result.count {
        if result[i] != result[result.count - 1 - i] {
            return false
        }
    }
    
    return true
}

print(isPalindrome("race a car"))
