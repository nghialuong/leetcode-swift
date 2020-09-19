/*
 https://leetcode.com/problems/expressive-words/
 */

import Foundation

// Nghia's solution
// turn S: "heeellooo" into h1e3l2o3 and "hello" into h1l2o1

func expressiveWords(_ S: String, _ words: [String]) -> Int {
    if S.count == 0 {
        return 0
    }
    let encodedS = wordToEncodedArray(word: S)
    var result = 0
    
    for i in 0..<words.count {
        let encodedWord = wordToEncodedArray(word: words[i])
        if encodedWord.count != encodedS.count {
            continue
        }
        
        var accept = true
        for j in 0..<encodedS.count {
            let strS = encodedS[j]
            if Character(strS).isLetter == false {
                let strW = encodedWord[j]
                if Int(strS)! < 3 {
                    if Int(strS)! != Int(strW)! {
                        accept = false
                        break
                    }
                } else { // >= 3
                    if Int(strS)! < Int(strW)! {
                        accept = false
                        break
                    }
                }
            }
            else {
                if encodedS[j] != encodedWord[j] {
                    accept = false
                    break
                }
            }
        }
        
        if accept == true {
            result += 1
        }
    }
    return result
}

func wordToEncodedArray(word: String) -> [String] {
    let chars = Array(word)
    var counter = 1
    var result = [String]()
    result.append(String(chars[0]))
    if word.count == 1 {
        result.append("1")
        return result
    }
    for i in 1..<chars.count {
        if chars[i] == chars[i-1] {
            counter += 1
        } else {
            result.append(String(counter))
            counter = 1
            result.append(String(chars[i]))
        }
        if i == chars.count - 1 {
            result.append(String(counter))
        }
    }
    return result
}

print(expressiveWords("heeellooo", ["axxxrrzzz"]))
