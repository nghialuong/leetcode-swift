/*
 Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.

 Example 1:

 Input: [[0,30],[5,10],[15,20]]
 Output: false
 Example 2:

 Input: [[7,10],[2,4]]
 Output: true
 */


func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count == 0 {
        return true
    }
    
    var starts = Array(repeating: 0, count: intervals.count)
    var ends = Array(repeating: 0, count: intervals.count)
    
    for i in 0..<intervals.count {
        starts[i] = intervals[i][0]
        ends[i] = intervals[i][1]
    }
    
    starts.sort()
    ends.sort()
    
    for i in 0..<intervals.count-1 {
        if ends[i] > starts[i+1] {
            return false
        }
    }
    
    return true
}

print(canAttendMeetings([[0,30],[5,10],[15,20]]))
