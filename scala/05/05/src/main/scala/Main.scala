// See R or Python code for today's challenge description

object Main extends App {

  def partition(seq: String, lb: Int, ub: Int, trigger: Character): Int = {

    var lbm = lb
    var ubm = ub

    for (part <- seq) {
      val amt = ((ubm - lbm)/2).floor.toInt + 1
      if (part == trigger) {
        ubm = ubm - amt
      } else {
        lbm = lbm + amt
      }
    }

    return(if (seq.takeRight(1) == trigger) ubm else lbm)

  }

  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/05-01.txt")
  val input = (for (line <- bufferedSource.getLines()) yield line).toList
  bufferedSource.close
  
  val records = input.map( (line : String) =>
    (partition(line.substring(0, 7), 0, 127, 'F') * 8) + partition(line.substring(7, 10), 0, 7, 'L')
  ).sortWith(_ < _)


  // 05-01

  println(records.max)
  
  // 04-02

  val diff = records.sliding(2).map { case Seq(x, y, _*) => y - x }.toList
  
  println(records(diff.indexWhere(_ > 1)) + 1)
   
}