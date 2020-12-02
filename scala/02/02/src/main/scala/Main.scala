// See R or Python code for today's challenge description

// fwiw this is super similar to js

import scala.util.matching.Regex

object Main extends App {
  
  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/02-01.txt")
  val input = (for (line <- bufferedSource.getLines()) yield line).toList
  bufferedSource.close

  // 02-01

  val pat1 = new Regex("""([^-]+)-([^ ]+) ([^:]+): (.*)$""", "min", "max", "letter", "password");

  println(
    input.map { (line) => 

      val res = pat1.findFirstMatchIn(line).get
      val pass = res.group("password").split("").filter{ _ == res.group("letter")}.mkString("")

      ((pass.length >= res.group("min").toInt) & (pass.length <= res.group("max").toInt))

    }.filter(identity).length
  )

  // 02-02

  val pat2 = new Regex("""([^-]+)-([^ ]+) ([^:]+): (.*)$""", "pos1", "pos2", "letter", "password")

  println(
    input.map { (line) => 

      val res = pat2.findFirstMatchIn(line).get
      val pass = res.group("password")
      val pos1 = res.group("pos1").toInt
      val pos2 = res.group("pos2").toInt
      val ltr = res.group("letter").charAt(0)

      ((pass.charAt(pos1-1) == ltr) |
       (pass.charAt(pos2-1) == ltr)) &
       (pass.charAt(pos1-1) != pass.charAt(pos2-1))

    }.filter(identity).length
  )


}