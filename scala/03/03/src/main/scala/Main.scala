// See R or Python code for today's challenge description

object Main extends App {
  
  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/03-01.txt")
  // val bufferedSource = io.Source.fromFile("/tmp/test.txt")
  val orig_map = (for (line <- bufferedSource.getLines()) yield line).toList
  bufferedSource.close

  // 03-01

  def countTrees (orig_map: List[String], slopeX: Int, slopeY: Int) : Int = {

    val mCols = orig_map(0).length
    val mRows = orig_map.length

    val nTiles = math.floor((slopeX+1) * mRows / (mCols)).toInt

    val actual_map = orig_map.map((row : String) => {
      row.repeat(nTiles)
    })

    var xPos = 0
    var yPos = 0
    var nTrees = 0

    while (yPos < mRows) {

      xPos += slopeX
      yPos += slopeY

      if (yPos < mRows) {
        if (actual_map(yPos).charAt(xPos) == '#') nTrees += 1
      }

    }
    
    return(nTrees)

  }

  // 03-01

  println(countTrees(orig_map, 3, 1))

  // 03-02

  val x = Array(1, 3, 5, 7, 1)
  val y = Array(1, 1, 1, 1, 2)

  val res = (0 to (x.length-1))
              .map( (idx) => countTrees(orig_map, x(idx), y(idx)) )
              .reduce { (a, b) => a * b }


  println(res)

}