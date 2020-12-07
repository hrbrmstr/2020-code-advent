import Foundation

public class advent05 {
  
  static func partition(seq: String, lb: Double, ub: Double, trigger: String) -> Double {
    
    var lb = lb
    var ub = ub
    
    for part in seq {
      
      let amt = floor(Double((ub - lb)/2)) + 1
      if (String(part) == trigger) {
        ub -= amt
      } else {
        lb += amt
      }
      
    }
    
    return((String(seq.last!) == trigger) ? ub : lb)

  }
  
  public static func day_05_01() -> Double {
    
    guard let input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/05-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    let res = input.filter { line in line != "" }.map { (line) -> Double in
      
      let endIndex = line.index(line.startIndex, offsetBy: 7)
      let rowPart = line[line.startIndex..<endIndex]
      let seatPart = line[endIndex..<line.endIndex]
      
      return((partition(seq: String(rowPart), lb: 0, ub: 127, trigger: "F") * 8) + partition(seq: String(seatPart), lb: 0, ub: 7, trigger: "L"))
      
    }
        
    return(res.max()!)
    
  }
  
  
  public static func day_05_02() -> Int {
    
    guard let input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/05-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    var res = input.filter { line in line != "" }.map { (line) -> Int in
      
      let endIndex = line.index(line.startIndex, offsetBy: 7)
      let rowPart = line[line.startIndex..<endIndex]
      let seatPart = line[endIndex..<line.endIndex]
      
      return(Int((partition(seq: String(rowPart), lb: 0, ub: 127, trigger: "F") * 8)) + Int(partition(seq: String(seatPart), lb: 0, ub: 7, trigger: "L")))
      
    }
    
    res.sort()
    
    var prev  = res[0]
    let diff : [Int] = res.map { val in
      defer { prev = val }
      return( val - prev )
    }
        
    return(res[diff.firstIndex { (val) -> Bool in val > 1 }!] - 1)
    
  }
  
}

