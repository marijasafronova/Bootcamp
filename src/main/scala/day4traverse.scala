object day4traverse extends App {

  val numbers = (-10 to 20).toArray
  val over5 = numbers.count(_>5)

  val alsoOver5 = numbers count {_ > 5} //anonymous function inside

  println(s"There is $over5 numbers over 5 in $numbers.toList")

  val  n3_7 = (3 to 7).toArray
  val nDiff = numbers diff n3_7
  println(nDiff.toList) // quick printing

  val n5_9 = (5 to 9).toArray
  val n8_9 = n5_9.diff(n3_7)
  println(n8_9)

  println(numbers.drop(8).mkString(","))

  val positives = numbers.dropWhile(_ <1)
  println(positives.toList)

  val cloneNumbers = numbers.concat(numbers)
  println(cloneNumbers.mkString(","))




}
