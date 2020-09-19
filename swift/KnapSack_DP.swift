// https://www.geeksforgeeks.org/0-1-knapsack-problem-dp-10/
// short DP
// Nghia invented

func knapSack(values: [Int], weights: [Int], totalWeight: Int) -> Int {
    
    var dp = Array(repeating: Int.max, count: totalWeight+1)
    dp[0] = 0
    
    for i in 1..<totalWeight+1 {
        for j in 0..<weights.count {
            if i >= weights[j] {
                dp[i] = min(dp[i], dp[i-weights[j]] + values[j])
            } else {
                dp[i] = min(dp[i], values[j])
            }
        }
    }
    return dp[totalWeight]
    
}

let values = [60, 100, 120]
let weights = [10,20,30]
let totalWeight = 50

print(knapSack(values: values, weights: weights, totalWeight: totalWeight))

