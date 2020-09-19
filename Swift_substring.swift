func subString(_ s: String, start: Int, len: Int) -> String {
    let from = s.index(s.startIndex, offsetBy: start)
    let to = s.index(s.endIndex, offsetBy: -(s.count - start - len))
    let sub = s[from..<to]
    return String(sub)
}
