import Foundation

public class advent06 {
  
  static func explode(_ arr : [ String ]) -> [ [Character] ] {
    return([ Array("hello") ])
  }
  
  public static func day_06_01() -> Int {
  
    guard var input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/06-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    input.insert("", at: 0)
    
    let res: [[String]] = input.reduce(into: []) {
      ($1 == "") ? $0.append([$1]) : $0[$0.index(before: $0.endIndex)].append($1)
    }
    .filter { $0.count > 1 }
    .map { $0.filter { !$0.isEmpty } }

    var holding  = [[[ Character ]]]()
    res.forEach { (entry : [ String ]) in holding.append( entry.compactMap { Array($0) } ) }
    
    return(holding.map{ $0.flatMap{$0}.unique().count }.sum())
    
  }

  public static func day_06_02() -> Int {
    
    guard var input = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/06-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    input.insert("", at: 0)
    
    let res: [[String]] = input.reduce(into: []) {
      ($1 == "") ? $0.append([$1]) : $0[$0.index(before: $0.endIndex)].append($1)
    }
    .filter { $0.count > 1 }
    .map { $0.filter { !$0.isEmpty } }
       
    var holding  = [[[ Character ]]]()
    res.forEach { (entry : [ String ]) in holding.append( entry.compactMap { Array($0) } ) }
    
    return(
      holding.map { (a) in
        [ a.flatMap{$0}.reduce(into: [:]) { counts, val in counts[val, default: 0] += 1 }.filter{ $0.value == a.count } ]
      }
      .map { $0.map{ $0.keys.count } }
      .reduce([], +)
      .sum()
    )
    
  }

}

extension Sequence where Iterator.Element: Hashable {
  func unique() -> [Iterator.Element] {
    var seen: Set<Iterator.Element> = []
    return filter { seen.insert($0).inserted }
  }
}

extension Sequence where Element: AdditiveArithmetic {
  func sum() -> Element { reduce(.zero, +) }
}
