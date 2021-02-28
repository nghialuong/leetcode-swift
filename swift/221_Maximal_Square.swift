// 221_Maximal_Square

// Solution: DP, if 3x3 square is valid so that means 2x2 should be valid too
// Time: O(mn)
// Space: O(mn)

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rowCount = matrix.count
    let colCount = matrix[0].count
    var dp = Array(repeating: Array(repeating: 0, count: colCount + 1), count: rowCount + 1)
    var maxLen = 0
    
    for i in 1..<rowCount + 1 {
        for j in 1..<colCount + 1 {
            if matrix[i-1][j-1] == "1" {
                dp[i][j] = 1 + min(dp[i-1][j], min(dp[i-1][j-1], dp[i][j-1]))
                maxLen = max(maxLen, dp[i][j])
            }
        }
    }
    
    return maxLen*maxLen
}

func arrayOfStringsToChars(_ array: [[String]]) -> [[Character]] {
    var finalArr: [[Character]] = [[Character]]()
    for arrItem in array {
        var arr: [Character] = [Character]()
        for item in arrItem {
            arr.append(Character(item))
        }
        finalArr.append(arr)
    }
    print(finalArr)
    return finalArr
}

let test = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
print(maximalSquare(arrayOfStringsToChars(test)))
