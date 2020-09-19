/*
https://leetcode.com/problems/minimum-domino-rotations-for-equal-row/
*/

import Foundation

func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
    let rotationCount = calculate(target: A[0], A: A, B: B)
    if rotationCount != -1 || A[0] == B[0] {
        return rotationCount
    }
    return calculate(target: B[0], A: A, B: B)
}

func calculate(target: Int, A: [Int], B: [Int]) -> Int {
    var aCounter = 0
    var bCounter = 0
    for i in 0..<A.count {
        if A[i] != target && B[i] != target {
            return -1
        }
        else if A[i] != target {
            aCounter += 1
        } else if B[i] != target {
            bCounter += 1
        }
    }
    return min(aCounter, bCounter)
}

print(minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2]))
