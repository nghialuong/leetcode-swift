/*
 Given an array of integers arr of even length n and an integer k.

 We want to divide the array into exactly n / 2 pairs such that the sum of each pair is divisible by k.

 Return True If you can find a way to do that or False otherwise.

  

 Example 1:

 Input: arr = [1,2,3,4,5,10,6,7,8,9], k = 5
 Output: true
 Explanation: Pairs are (1,9),(2,8),(3,7),(4,6) and (5,10).
 Example 2:

 Input: arr = [1,2,3,4,5,6], k = 7
 Output: true
 Explanation: Pairs are (1,6),(2,5) and(3,4).
 Example 3:

 Input: arr = [1,2,3,4,5,6], k = 10
 Output: false
 Explanation: You can try all possible pairs to see that there is no way to divide arr into 3 pairs each with sum divisible by 10.
 
 Time: O(n)
 
 */

func canArrange(_ arr: [Int], _ k: Int) -> Bool {
    var freq: [Int] = Array(repeating: 0, count: k+1)
    
    for num in arr {
        var rem = num % k
        if rem < 0 {
            rem += k
        }
        freq[rem] += 1
    }
    
    print(freq)
    
    for i in 1..<(k+1)/2 {
        print(freq[i])
        if freq[i] != freq[k-i] {
            return false
        }
    }
    
    return freq[0] % 2 == 0
}

print(canArrange([-1,-1,-1,-1,2,2,-2,-2], 3))

