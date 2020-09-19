/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]
 
 Time: kho
 Space: kho
 */

import Foundation

func generateParenthesis(_ n: Int) -> [String] {
    var res = [String]()
    backtrack(current: "", max: n, openCount: 0, closeCount: 0, result: &res)
    return res
}

func backtrack(current: String, max: Int, openCount: Int, closeCount: Int, result: inout [String]) {
    if current.count == max * 2 {
        result.append(current)
        return
    }
    if openCount < max {
        backtrack(current: current + "(", max: max, openCount: openCount + 1, closeCount: closeCount, result: &result)
    }
    if closeCount < openCount {
        backtrack(current: current + ")", max: max, openCount: openCount, closeCount: closeCount + 1, result: &result)
    }
}

print(generateParenthesis(4))
