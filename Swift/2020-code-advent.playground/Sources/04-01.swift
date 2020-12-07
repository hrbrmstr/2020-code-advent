import Foundation

public class advent04 {
  
  public static func day_04_01() -> Int {
    
    let reqKeys: Set = [ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ]
    
    guard var input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/04-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    input.insert("", at: 0)
    
    let res: [[String : String]] = input.reduce(into: []) {
      ($1 == "") ? $0.append([$1]) : $0[$0.index(before: $0.endIndex)].append($1)
    }
    .filter { $0.count > 1 }
    .map {
      $0.filter { !$0.isEmpty }
        .joined(separator: " ")
        .components(separatedBy: " ")
        .filter { !$0.starts(with: "cid") }
        .reduce(into: [String: String]()) {
          let res = $1.split(separator: ":")
          $0[String(res[0])] = String(res[1])
        }
    }
    
    return(
      res.map { reqKeys.symmetricDifference(Set($0.keys)) }
        .filter { $0.count == 0 }
        .count
    )
    
  }
  
  static func validateHeight(_ x: String) -> Bool {
    let amt = Int(x.replacingOccurrences(of: "[[:alpha:]]", with: "", options: [.regularExpression]))!
    let unit = x.replacingOccurrences(of: "[[:digit:]]", with: "", options: [.regularExpression])
    return((unit == "in") ? amt.between(59, 76) : amt.between(150, 193))
  }
  
  public static func day_04_02() -> Int {
    
    let reqKeys: Set = [ "byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid" ]
    let hairColors = [ "amb", "blu", "brn", "gry", "grn", "hzl", "oth" ]

    guard var input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/04-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    input.insert("", at: 0)
    
    let res: [[String : String]] = input.reduce(into: []) {
      ($1 == "") ? $0.append([$1]) : $0[$0.index(before: $0.endIndex)].append($1)
    }
    .filter { $0.count > 1 }
    .map {
      $0.filter { !$0.isEmpty }
        .joined(separator: " ")
        .components(separatedBy: " ")
        .filter { !$0.starts(with: "cid") }
        .reduce(into: [String: String]()) {
          let res = $1.split(separator: ":")
          $0[String(res[0])] = String(res[1])
        }
    }
    
    return(
      res.filter { reqKeys.symmetricDifference(Set($0.keys)).count == 0 }
        .filter {
          $0.filter {
            var res: Bool
            switch($0.key) {
            case "byr": res = $0.value.matches("^[0-9]{4}$") && Int($0.value)!.between(1920, 2002)
            case "iyr": res = $0.value.matches("^[0-9]{4}$") && Int($0.value)!.between(2010, 2020)
            case "eyr": res = $0.value.matches("^[0-9]{4}$") && Int($0.value)!.between(2020, 2030)
            case "hgt": res = $0.value.matches("^[0-9]{2,3}(cm|in)$") && validateHeight($0.value)
            case "hcl": res = $0.value.matches("^#[a-f0-9]{6}$")
            case "ecl": res = hairColors.contains($0.value)
            case "pid": res = $0.value.matches("^[0-9]{9}$")
            default: res = false
            }
            return(res)
          }.count == 7
        }.count
    )
    
  }
  
}

extension String {
  func matches(_ regex: String) -> Bool {
    return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
  }
}

extension Comparable {
  func between( _ lb: Self,  _ ub: Self) -> Bool {
    return( (self >= lb) && (self <= ub) )
  }
}
