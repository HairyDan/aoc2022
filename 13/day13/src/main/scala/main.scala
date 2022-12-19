import scala.io.Source
object Main {
  def main(args: Array[String]): Unit = {
    val data = Source.fromFile("input.txt").getLines.toArray
    println("PART 1: " + ripAndSum(data))
    println("PART 2: " + part2(data))
  }

  def compare(left: String, right: String): Boolean = {
    if (left.nonEmpty && right.nonEmpty) {
      if (left.head != right.head) {
        if (left.head == ']') {
          true
        } else if (right.head == ']') {
          false
        } else if (left.head == '[') {
          compare(left, s"[${right.head}]" ++ right.tail)
        } else if (right.head == '[') {
          compare(s"[${left.head}]" ++ left.tail, right)
        } else {
          left.head < right.head
        }
      }
      else compare(left.tail, right.tail)
    }
    else left.nonEmpty
  }

  //stole this nice idea of single-char'ing the 10s
  def parse(input: Seq[String]): Seq[String] =
    input.filter(_.nonEmpty).map(_.replace("10", "A"))

  def ripAndSum(input: Seq[String]): Int =
    parse(input).grouped(2).zipWithIndex.collect {
      case (Seq(left, right), index) if compare(left, right) => index + 1
    }.sum

  def part2(input: Seq[String]): Int = {
    val divider1 = "[[2]]"
    val divider2 = "[[6]]"

    val sorted = (parse(input) ++ Seq(divider1, divider2)).sortWith(compare)

    val indexOfDivider1 = sorted.indexOf(divider1) + 1
    val indexOfDivider2 = sorted.indexOf(divider2) + 1

    indexOfDivider1 * indexOfDivider2
  }
}
