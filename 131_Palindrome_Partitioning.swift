/*

 Given a string s, partition s such that every substring of the partition is a palindrome.

 Return all possible palindrome partitioning of s.

 Example:

 Input: "aab"
 Output:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 
 Time: O(n*2^n)
 Space: O(n)
 */

import Foundation

class Solution {
    
    var result = [[String]]()
    
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        var list = [String]()
        backtrack(chars: chars, index: 0, list: &list)
        return result
    }
    
    func backtrack(chars: [Character], index: Int, list: inout [String]) {
        if index == chars.count {
            result.append(list)
            return
        }
        
        for i in index..<chars.count {
            if isPal(chars: chars, low: index, high: i) {
                list.append(String(chars[index..<i+1]))
                backtrack(chars: chars, index: i+1, list: &list)
                list.removeLast()
            }
        }
    }
    
    func isPal(chars: [Character], low: Int, high: Int) -> Bool {
        var low = low
        var high = high
        while low < high {
            if chars[low] != chars[high] {
                return false
            }
            low += 1
            high -= 1
        }
        return true
    }
}

let sol = Solution()
print(sol.partition("acc"))
