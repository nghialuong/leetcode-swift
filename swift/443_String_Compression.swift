
/*
 https://leetcode.com/problems/string-compression/
 Time: O(n)
 Space: O(n)
 */


func compress(_ chars: inout [Character]) -> Int {
    var current = chars[0]
    var count = 1
    var res = ""
    
    for i in 1...chars.count {
        if i == chars.count {
            if count == 1 {
                res += String(current)
            } else {
                res += "\(current)\(count)"
            }
            break
        }
        
        if current != chars[i]  {
            if count == 1 {
                res += String(current)
            } else {
                res += "\(current)\(count)"
            }
            count = 1
            current = chars[i]
        } else {
            count += 1
        }
    }
    
    chars = Array(res)
    return res.count
}


var chars: [Character] = ["a","a","b","b","c","c","c"]
print(compress(&chars))
