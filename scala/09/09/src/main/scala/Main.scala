// See R or Python code for today's challenge description

import util.control.Breaks._
import java.text.NumberFormat

object Main extends App {

  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/09-01.txt")
  val input = (for (line <- bufferedSource.getLines()) yield line).toArray
  bufferedSource.close

  // val input = Array(35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576)
  
  var records = input.map((x) => x.toLong)
  val preamble_length = 25
  var condition = true

  // 09-01

  val pairs = (0 to (preamble_length-1)).combinations(2).toArray

  while (condition && (records.size > preamble_length)) {

    breakable { for (pair <- pairs) { 
      condition = (records(pair.head) + records(pair.last)) == records(preamble_length)
      if (condition) break
    }}

    if (condition) records = records.drop(1)

  }

  val invalid = records(preamble_length)

  println(invalid)

  // 09-02

  def cumsum[A](xs: Seq[A])(implicit num: Numeric[A]): Seq[A] = {
    xs.tail.scanLeft(xs.head)(num.plus)
  }

  var startPos = -1
  var invalidPos = -1

  records = input.map((x) => x.toLong)

  breakable { for (idx <- records.indices) {
    val csum = cumsum(records.slice(idx, records.length))
    if (csum.contains(invalid)) {
      startPos = idx
      invalidPos = csum.indexOf(invalid)
      break
    }
  }}

  val rng = records.slice(startPos, startPos+invalidPos+1)
  
  println(rng.min + rng.max)
   
}