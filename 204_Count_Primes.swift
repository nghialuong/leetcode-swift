/*
 Count the number of prime numbers less than a non-negative number, n.
 
 Example:
 
 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 */

import Foundation

func countPrimes(_ n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    var notPrimeNums = Array(repeating: false, count: n)
    notPrimeNums[0] = true
    notPrimeNums[1] = true
    
    var counter = 0
    
    for i in 2..<n {
        if notPrimeNums[i] == false {
            counter += 1
            for j in 2..<n {
                if i*j >= n {
                    break
                }
                notPrimeNums[i*j] = true
            }
        }
    }
    
    return counter
}


print(countPrimes(10))
