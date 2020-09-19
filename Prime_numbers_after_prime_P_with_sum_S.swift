/*
 https://www.geeksforgeeks.org/prime-numbers-after-prime-p-with-sum-s/
 */

import Foundation

func allPrime(_ N: Int, _ P: Int, target: Int) -> [[Int]] {
    var primes = [Int]()
    var res = [[Int]]()
    for i in P..<target {
        if isPrime(i) {
            primes.append(i)
        }
    }
    
    print(primes)
    
    if primes.count < N {
        return []
    }
    var set = [Int]()
    primeSum(total: 0, index: 0, primes: primes, N, target: target, set: &set, result: &res)
    
    return res
}

func isPrime(_ n: Int) -> Bool {
    if n == 1 {
        return false
    }
    for i in 2..<Int(Double(n).squareRoot())+1 {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func primeSum(total: Int, index: Int, primes: [Int], _ N: Int, target: Int, set: inout [Int], result: inout [[Int]]) {
    if total == target && set.count == N {
        result.append(set)
        return
    }
    if index >= primes.count || total > target || set.count >= N {
        return
    }
    
    set.append(primes[index])
    primeSum(total: total + primes[index], index: index + 1, primes: primes, N, target: target, set: &set, result: &result)
    
    set.removeLast()
    primeSum(total: total, index: index + 1, primes: primes, N, target: target, set: &set, result: &result)
}

print(allPrime(3, 2, target: 45))
