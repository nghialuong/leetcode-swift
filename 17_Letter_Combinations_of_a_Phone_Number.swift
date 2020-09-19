/*
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
Example:

Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
*/

func letterCombinations(_ digits: String) -> [String] {
    guard digits.count > 0 else {
        return []
    }              

     let table: [String: [String]] = [
         "0": [],
         "1": [],
         "2": ["a", "b", "c"],
         "3": ["d", "e", "f"],
         "4": ["g", "h", "i"],
         "5": ["j", "k", "l"],
         "6": ["m", "n", "o"],
         "7": ["p", "q", "r", "s"],
         "8": ["t","u","v"],
         "9": ["w", "x", "y", "z"]
     ]

    var result = [String]()
    result.append("")
    let digitChars = Array(digits) 
    for dChar in digitChars {
        if let letters = table[String(dChar)] {
            result = combine(letters, result)
        }
    }

    return result
}

func combine(_ letters: [String], _ result: [String]) -> [String] { 
    var list = [String]()
    for i in 0..<letters.count {
        for r in result {
            list.append(r + String(letters[i]))
        }
    }
    return list
}


print(letterCombinations("23211"))
