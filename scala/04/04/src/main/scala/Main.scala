// See R or Python code for today's challenge description

import scala.util.chaining._
import scala.collection.immutable.SetOps
import scala.annotation.switch

object Main extends App {
  
  // val bufferedSource = io.Source.fromFile("/tmp/test.txt")
  val bufferedSource = io.Source.fromFile("/Users/hrbrmstr/Development/2020-code-advent/input/04-01.txt")
  val input = (for (line <- bufferedSource.getLines()) yield line).toList
  bufferedSource.close
  
  val reqKeys = Set("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")

  val records = input
    .pipe("" :: _)
    .foldLeft(List.empty[List[String]]) {
      case ((head :: tail), line) if line != "" => (line :: head) :: tail
      case (recs, line) => List(line) :: recs
    }
    .map {
      _.filter(_ != "")
      .mkString(" ")
      .split(" ")
    }
    .filterNot(_.startsWith("cid"))
    .map { (line) =>
      line.map { (kv) =>
        kv.split(":") match { case Array(k, v) => Map(k -> v) }
      }.reduce (_ ++ _).-("cid")
    }

  // 04-01

  println(
    records.filter { (record) =>
      reqKeys.diff(record.keySet).size == 0
    }.length
  )
  
  // 04-02

  implicit class NumberHelpers(val i: Int) { 
    def between(lb: Int, ub: Int): Boolean = ( (i >= lb) && (i <= ub) )
  }

  val hair_colors = Array("amb", "blu", "brn", "gry", "grn", "hzl", "oth")

  def validate_height(x: String): Boolean = {

    val amt = x.replaceAll("[a-z]", "").toInt
    val unit = x.replaceAll("[0-9]", "")
    
    if (unit == "in") amt.between(59, 76) else amt.between(150, 193)

  }

  println(
    records
      .filter { (record) => reqKeys.diff(record.keySet).size == 0 }
      .filter((record) => {
        record.filter((kv) => {
          (kv._1 : @switch) match {
            case "byr" => (kv._2 matches(raw"^[0-9]{4}$$")) && (kv._2.toInt.between(1920, 2002))
            case "iyr" => (kv._2 matches(raw"^[0-9]{4}$$")) && (kv._2.toInt.between(2010, 2020))
            case "eyr" => (kv._2 matches(raw"^[0-9]{4}$$")) && (kv._2.toInt.between(2020, 2030))
            case "hgt" => (kv._2 matches(raw"^[0-9]+(cm|in)$$")) && (validate_height(kv._2))
            case "hcl" => kv._2 matches(raw"#[0-9a-f]{6}$$")
            case "ecl" => hair_colors.contains(kv._2)
            case "pid" => kv._2 matches(raw"^[0-9]{9}$$")
            case "cid" => true
          }
        }).size == 7
      }).size
  )

}