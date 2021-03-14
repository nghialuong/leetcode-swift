
/*
1. An anagram is a word that can be written as a permutation of the characters of another word, like "dirty room" and "dormitory" (ignore spaces).
However, "the" and "thee" are not anagrams, since "the" only has a single "e" whereas "thee" has two "e" characters (spaces can occur zero, or multiple times, however.)
Given a list of words as strings, you should return another list of strings, each containing words that are mutual anagrams.
Each string of the output should be a single group of anagrams joined with commas.

Example input:
pear
amleth
dormitory
tinsel
dirty room
hamlet
listen
silent

Example output:
amleth,hamlet
dirty room,dormitory
listen,silnet,tinsel
pear
*/


import Foundation

// Solution: Hashtable
// Time: O(nlogn) - depends on the sorted() algo
// Space: O(n) - depends on the size of input

func findAnagrams(list: [String]) -> [String] {
    
    func makeKey(_ word: String) -> String {
        let chars = word.lowercased().components(separatedBy: .whitespaces).joined().sorted() // O(nlogn)
        return String(chars)
    }
    
    var table = [String: [Int]]()
    
    for (idx, element) in list.enumerated() { // O(n)
        let key = makeKey(element)
        if table[key] == nil {
            table[key] = [idx]
        } else {
            var indexes: [Int] = table[key]!
            indexes.append(idx)
            table[key] = indexes
        }
    }
    
    var output = [String]()
    
    for (_, indexesOfOrigianl) in table {
        var resultOfEachPair = ""
        
        for (index, indexOfOriginal) in indexesOfOrigianl.enumerated() { // O(n)
            if index > 0 {
                resultOfEachPair += ", "
            }
            resultOfEachPair += list[indexOfOriginal]
        }
        
        output.append(resultOfEachPair)
    }
    
    return output
}

let input: [String] = ["pear", "amleth", "dormitory", "tinsel", "dirty room", "hamlet", "listen", "silent"]
print (findAnagrams(list: input))
