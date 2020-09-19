/*
 Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.

 Examples:
 Input: S = "a1b2"
 Output: ["a1b2", "a1B2", "A1b2", "A1B2"]

 Input: S = "3z4"
 Output: ["3z4", "3Z4"]

 Input: S = "12345"
 Output: ["12345"]
 Note:

 S will be a string with length between 1 and 12.
 S will consist only of letters or digits.
 */

import Foundation

func letterCasePermutation(_ S: String) -> [String] {
    var res = [String]()
    let chars = Array(S)
    backtrack(index: 0, current: chars, for: &res)
    return res
}

func backtrack(index: Int, current: [Character], for result: inout [String]) {
    if index == current.count {
        result.append(String(current))
        print("add : \(String(current))")
        return
    }
    var currentChars = current
    if currentChars[index].isLetter {
        currentChars[index] = Character(String(currentChars[index]).uppercased())
        backtrack(index: index + 1, current: currentChars, for: &result)
        currentChars[index] = Character(String(currentChars[index]).lowercased())
        backtrack(index: index + 1, current: currentChars, for: &result)
    } else {
        backtrack(index: index + 1, current: currentChars, for: &result)
    }
}

print(letterCasePermutation("a1b2"))

