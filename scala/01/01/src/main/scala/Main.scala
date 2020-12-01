// See R or Python code for today's challenge description

object Main extends App {

  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/01-01.txt")
  val input = (for (line <- bufferedSource.getLines()) yield line.toInt).toList
  bufferedSource.close
  
  // 01-01

  val pairs = input.combinations(2).toSeq
  
  var sums = pairs.map { _.reduce((a, b) => a + b )}

  var idx = sums.indexOf(2020)
  
  println(pairs(idx).reduce { (a, b) => a * b })

  // 01-02

  var tri = input.combinations(3).toSeq

  sums = tri.map { _.reduce((a, b) => a + b )}

  idx = sums.indexOf(2020)

  println(tri(idx).reduce { (a, b) => a * b })

}