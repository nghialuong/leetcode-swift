/*
 Implement int sqrt(int x).

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

 Example 1:

 Input: 4
 Output: 2
 Example 2:

 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.
 */

import Foundation

func mySqrt(_ x: Int) -> Int {
    if x == 1 {
        return 1
    }
    var start = 0
    var end = x
    while start < end {
        let mid = start + (end - start) / 2
        if mid <= x / mid && mid + 1 > x / (mid + 1) {
            return mid
        } else if mid < x / mid {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return start
}

print(mySqrt(0))
