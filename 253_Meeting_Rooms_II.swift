/*
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

 Example 1:

 Input: [[0, 30],[5, 10],[15, 20]]
 Output: 2
 Example 2:

 Input: [[7,10],[2,4]]
 Output: 1
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    if intervals.count < 1 {
        return 0
    }
    
    var starts = [Int]()
    var ends = [Int]()
    
    for i in 0..<intervals.count {
        starts.append(intervals[i][0])
        ends.append(intervals[i][1])
    }
    
    starts.sort()
    ends.sort()
    
    var usedRoom = 0
    var endPointer = 0
    var startPointer = 0
    
    while startPointer < intervals.count {
        if starts[startPointer] >= ends[endPointer] {
            usedRoom -= 1
            endPointer += 1
        }
        usedRoom += 1
        startPointer += 1
    }
    
    return usedRoom
}

print(minMeetingRooms([[0, 30],[5, 10],[15, 20]]))
