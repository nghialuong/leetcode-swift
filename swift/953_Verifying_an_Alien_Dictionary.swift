// 953_Verifying_an_Alien_Dictionary
//
// Time: O(n) - where n is sum of every word length of `words`
// Space: O(1)
 
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
    var map = [Int](repeating: -1, count: 26)
    let chars = Array(order)
    
    for i in 0..<chars.count {
        let index = Int(chars[i].asciiValue! - Character("a").asciiValue!)
        map[index] = i
    }
    
    for i in 1..<words.count {
        if compare(words[i-1], words[i], map) > 0 {
            return false
        }
    }
    
    return true
}

func compare(_ w1: String, _ w2: String, _ map: [Int]) -> Int {
    var i = 0
    var j = 0
    let chars1 = Array(w1)
    let chars2 = Array(w2)
    var comparedVal = 0
    
    while i < w1.count && j < w2.count && comparedVal == 0 {
        let val1 = Int(chars1[i].asciiValue! - Character("a").asciiValue!)
        let val2 = Int(chars2[i].asciiValue! - Character("a").asciiValue!)
        comparedVal = map[val1] - map[val2]
        i += 1
        j += 1
    }
    
    if comparedVal == 0 {
        return chars1.count - chars2.count
    }
    return comparedVal
}


print(isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz"))
