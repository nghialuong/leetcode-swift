/*
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
 
 Example 1:
 
 Input: coins = [1, 2, 5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:
 
 Input: coins = [2], amount = 3
 Output: -1
 Note:
 You may assume that you have an infinite number of each kind of coin.
 */

// Bottom - up

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = Array(repeating: amount+1, count: amount+1)
    dp[0] = 0
    
    let sortedCoins = coins.sorted()
    for i in 0..<amount+1 {
        for j in 0..<sortedCoins.count {
            if sortedCoins[j] <= i {
                dp[i] = min(dp[i], 1 + dp[i-sortedCoins[j]])
            } else {
                break
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}

let coins = [1,2,5]
print(coinChange(coins, 11))


// Top down

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var mem = [Int](repeating: 0, count: amount)
    return helper(coins: coins, remainder: amount, mem: &mem)
}

func helper(coins: [Int], remainder: Int, mem: inout [Int]) -> Int {
    if remainder < 0 {
        return -1
    }
    if remainder == 0 {
        return 0
    }
    if mem[remainder - 1] != 0 {
        return mem[remainder - 1]
    }
    var minRes = Int.max
    for coin in coins {
        let ways = helper(coins: coins, remainder: remainder - coin, mem: &mem)
        if ways >= 0 && ways < minRes {
            minRes = 1 + ways
        }
    }
    mem[remainder - 1] = minRes == Int.max ? -1 : minRes
    return mem[remainder - 1]
}

