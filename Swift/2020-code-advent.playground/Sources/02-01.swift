import Foundation

public class advent02 {
  
  public static func day_02_01() -> Int {
    
    guard let lines = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/02-01.txt", encoding: .utf8)
            .components(separatedBy: "\n") else {
      return(-1)
    }
    
    let pattern = "(?<min>[^-]+)-(?<max>[^ ]+) (?<letter>[^:]+): (?<password>.*)$"
    let regex = try? NSRegularExpression(pattern: pattern)
    
    var min: Int?
    var max: Int?
    var ltr: String?
    var password: String?
    
    let res = lines.map { (line) -> Bool in
      if let match = regex?.firstMatch(in: line, options: [], range: NSRange(location: 0, length: line.utf16.count)) {
        
        if let minRange = Range(match.range(withName: "min"), in: line) { min = Int(line[minRange]) }
        if let maxRange = Range(match.range(withName: "max"), in: line) { max = Int(line[maxRange]) }
        if let ltrRange = Range(match.range(withName: "letter"), in: line) { ltr = String(line[ltrRange]) }
        if let passwordRange = Range(match.range(withName: "password"), in: line) { password = String(line[passwordRange]) }
        
        let ct = password?.map { String($0) }.filter{ $0 == ltr }.count
        
        return((ct! >= min!) && (ct! <= max!))
        
      }
      return(false)
    }
    return( res.filter{ $0 }.count )
  }
  
  public static func day_02_02() -> Int {
    
    guard let lines = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/02-01.txt", encoding: .utf8)
            .components(separatedBy: "\n") else {
      return(-1)
    }
    
    let pattern = "(?<pos1>[^-]+)-(?<pos2>[^ ]+) (?<letter>[^:]+): (?<password>.*)$"
    let regex = try? NSRegularExpression(pattern: pattern)
    
    var pos1: Int?
    var pos2: Int?
    var ltr: String?
    var password: String?

    let res = lines.map { (line) -> Bool in
      if let match = regex?.firstMatch(in: line, options: [], range: NSRange(location: 0, length: line.utf16.count)) {
        
        if let pos1Range = Range(match.range(withName: "pos1"), in: line) { pos1 = Int(line[pos1Range]) }
        if let pos2Range = Range(match.range(withName: "pos2"), in: line) { pos2 = Int(line[pos2Range]) }
        if let ltrRange = Range(match.range(withName: "letter"), in: line) { ltr = String(line[ltrRange]) }
        if let passwordRange = Range(match.range(withName: "password"), in: line) { password = String(line[passwordRange]) }
        
        let ltridx = ltr!.startIndex
        let p1idx = password!.index(password!.startIndex, offsetBy: pos1!-1)
        let p2idx = password!.index(password!.startIndex, offsetBy: pos2!-1)
        
        return(
          ((password![p1idx] == ltr![ltridx]) ||
           (password![p2idx] == ltr![ltridx])) &&
           (password![p1idx] != password![p2idx])
        )
        
      }
      return(false)
    }
    return( res.filter{ $0 }.count )
  }
  
}
