/*
 
 Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.

 Note:

 The length of both num1 and num2 is < 5100.
 Both num1 and num2 contains only digits 0-9.
 Both num1 and num2 does not contain any leading zero.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
    var numArray = [String]()
    let chars1 = Array(num1)
    let chars2 = Array(num2)
    var i = chars1.count - 1
    var j = chars2.count - 1
    var carry = 0
    while i >= 0 || j >= 0 || carry == 1 {
        let n1 = i >= 0 ? Int(chars1[i].asciiValue! - Character("0").asciiValue!) : 0
        let n2 = j >= 0 ? Int(chars2[j].asciiValue! - Character("0").asciiValue!) : 0
        let sum = n1 + n2 + carry
        let res = sum % 10
        numArray.append(String(res))
        carry = sum / 10
        i -= 1
        j -= 1
    }
    
    numArray.reverse()
    var result = ""
    for str in numArray {
        result += str
    }
    return result
}

print(addStrings("23423", "33334"))


