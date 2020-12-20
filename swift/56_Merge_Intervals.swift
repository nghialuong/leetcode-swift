/*
 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

  

 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
  

 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104
 
 ---
 
 Time: O(nlogn)
 Space: O(n) - `result` needs to add pair
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    let sortedIntervals = intervals.sorted { (first, second) -> Bool in
        first[0] < second[0]
    }
    
    var newInterval = sortedIntervals[0]
    var result = [[Int]]()
    result.append(newInterval)
    
    for interval in sortedIntervals {
        if interval[0] <= newInterval[1] {
            newInterval[1] = max(newInterval[1], interval[1])
            result[result.count-1] = newInterval
        } else {
            newInterval = interval
            result.append(interval)
        }
    }
    
    return result
}

print(merge([[1,3],[2,6],[2,7],[8,10],[15,18]]))
