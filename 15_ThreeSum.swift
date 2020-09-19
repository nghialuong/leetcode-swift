func threeSum(_ nums: [Int]) -> [[Int]] {
    
    if nums.count < 3 {
            return [[Int]]()
    }

    let n = nums.sorted()
    var result = [[Int]]()
    
    for i in 0..<n.count-2 {

        // avoid duplicate i
        if (i > 0 && i-1 < n.count && n[i] == n[i-1]) {
            continue
        }

        var l = i + 1
        var h = n.count - 1

        while l < h {
            let sum = n[i] + n[l] + n[h]
            if sum == 0 {
                result.append([n[l], n[i], n[h]])
                // avoid duplicate l(-1): -4 -1 -1 0 1 2 
                while l+1 < h && n[l] == n[l+1] {
                    l += 1
                }
                // avoid duplicate h(2): -4 -1 -1 0 1 2 2 2 
                while l < h-1 && n[h] == n[h-1] {
                    h -= 1
                }

                l += 1
                h -= 1
            } 
            else if sum < 0 {
                l += 1
            }
            else {
                h -= 1
            }
        }
    
    }

    return result
        
}

print(threeSum([])) // -1 -1 0 1 2 
