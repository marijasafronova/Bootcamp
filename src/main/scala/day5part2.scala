object day5part2 extends App {

  val numbers = (-5 to 7).toList

  println(numbers.knownSize)
  println(numbers.toArray.knownSize)
  println(numbers.length)

  val emptyArr = Array[Int]()
  println((emptyArr.headOption.getOrElse(-9000))) // so returns Option, useful if you might get empty collection
  println((numbers.headOption.getOrElse(-9000)))

  val allButLast = numbers.init // gets all but the last element
  println(allButLast)

  val n3_7 = (3 to 7).toArray

  val numberIntersection = numbers.intersect(n3_7) // we can intersect List with an Array
  val also_intersection = n3_7.intersect(numbers)
  println(numberIntersection)
  println(also_intersection.mkString(", "))

  println(numbers.lastOption.getOrElse(9000)) // 7
  println(emptyArr.lastOption.getOrElse(9000)) // 9000

  val doublednumbers = numbers.concat(numbers)
  println(numbers.partition(_ > 3))
  println(doublednumbers.span(_ < 3))

  val numberUnion = doublednumbers ++ n3_7
  // for uniques we would convert to set
  println(numberUnion)
  println(numberUnion.toSet)
  println(numberUnion.toSet.toSeq.sorted)

  val listTuples = List((3, "Valdis"), (10, "Liga"), (20, "Janis"))

  val (col1, col2) = listTuples.unzip //unzips collection into two
  println(col1)
  println(col2)

  val letters = "abcdefgh"
  val zippedCol = numbers zip letters
  println(zippedCol)

  val indexedCol = letters.zipWithIndex
  println(indexedCol) // so actual value is first, the index is second
  println(indexedCol(3)) // prints tuple (d, 3)
}
