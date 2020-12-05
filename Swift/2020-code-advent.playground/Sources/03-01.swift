import Foundation

public class advent03 {
  
  static func count_trees(orig_map: [String], slope_x: Int, slope_y : Int) -> Int {
    
    let m_cols = orig_map[0].count
    let m_rows = orig_map.count
    let n_tiles = ((slope_x + 1) * m_rows) / (m_cols)
    
    let actual_map = orig_map.map { String(repeating: $0, count: n_tiles) }

//    actual_map.forEach{ debugPrint($0) }
//    debugPrint(actual_map[0].count)

    var xpos = 0
    var ypos = 0
    var n_trees = 0

    while(true) {

      xpos += slope_x
      ypos += slope_y

      if (ypos >= m_rows) { break }
      
      let rowidx = actual_map[ypos].index(actual_map[ypos].startIndex, offsetBy: xpos)
//      debugPrint("rowidx: \(rowidx.encodedOffset); y: \(ypos); m_rows: \(m_rows); [\(actual_map[ypos][rowidx])]")

      if (actual_map[ypos][rowidx] == "#") { n_trees += 1 }

    }
    
    return(n_trees)
    
  }
  
  public static func day_03_01() -> Int {
    guard let orig_map = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/03-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    return(count_trees(orig_map: orig_map.filter { line in line != "" }, slope_x: 3, slope_y: 1))
    
  }
  
  public static func day_03_02() -> Int {
    guard let orig_map = try? String(contentsOfFile: "/Users/hrbrmstr/Development/2020-code-advent/input/03-01.txt", encoding: .utf8)
            .components(separatedBy: "\n")  else {
      return(-1)
    }
    
    let x = [ 1, 3, 5, 7, 1 ]
    let y = [ 1, 1, 1, 1, 2 ]

    let res = stride(from: 0, to: x.count, by: 1).map { row in
      count_trees(orig_map: orig_map.filter { line in line != "" }, slope_x: x[row], slope_y: y[row])
    }.reduce(1, { a, b in a * b })
    
    return(res)
    
  }
  
}
