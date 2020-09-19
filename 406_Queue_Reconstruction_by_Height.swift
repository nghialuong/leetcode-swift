/*
 Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

 Note:
 The number of people is less than 1,100.

  
 Example

 Input:
 [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

 Output:
 [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
 
 Time: O(n^2)
 Space: O(n)
 */

import Foundation

func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
    let sortedPeople = people.sorted { (p1, p2) -> Bool in
        if p1[0] == p2[0] {
            return p1[1] < p2[1]
        }
        return p1[0] > p2[0]
    }
    var result = [[Int]]()
    for person in sortedPeople {
        result.insert(person, at: person[1])
    }
    return result
}
    
print(reconstructQueue([[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]))
