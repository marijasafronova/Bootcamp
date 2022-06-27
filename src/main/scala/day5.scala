object day5 extends App {

  val numbers = (-5 to 7).toArray
  println(numbers.mkString(","))

  val duplicateNumbers = numbers.concat(numbers)
  println(duplicateNumbers.mkString(","))

  val droppedNeg = duplicateNumbers.dropWhile(_<0)
  //dropWhile drops until predicate function stops being true
  println(droppedNeg.mkString(","))

  val takeFive = duplicateNumbers.take(5) // take first five
  println(takeFive.toList)

  val takeWhileNumbers = duplicateNumbers.takeWhile(_<0)
  //take items until predicates stops being true
  println(takeWhileNumbers.toList)

  //span is a collection of both
  val spanCollection = duplicateNumbers.span(_<2) //
  // we get a tuple of two arrays
  println(spanCollection._1.mkString(",")) // takeWhilePart
  println(spanCollection._2.mkString(",")) // dropWhilePart

  val alsoSpanCollection = (duplicateNumbers takeWhile{_<2}, duplicateNumbers dropWhile {_<2})
  //same result
  println(alsoSpanCollection._1.mkString(","))
  println(alsoSpanCollection._2.mkString(","))

  val firstFindEvenNumber = duplicateNumbers.find(_ % 2 == 0)
  // first item on which predicate function returns true
  println(firstFindEvenNumber) //returns Some because we might not find anything
  println(firstFindEvenNumber.getOrElse(0)) //here using ) to indicate we found nothing

  val arrTuples = List(List(3,5),List(35,32,2,6,1),List(3,1,6,6))

  val flatArr = arrTuples.flatten
  println(flatArr.mkString(","))

  val list3D = List(List(List(3,1,5), List(3,2,1,6)), List(List(3,1,5,1), List(3,1,5,99)))
  println(list3D(1))
  println(list3D(1)(1))
  println(list3D(1)(1)(3))
  println(list3D(1)(1).last)

  val flatList = list3D.flatten
  val flatterList = list3D.flatten.flatten
  println(flatList)
  println(flatterList)

  //flatMap combines flatten with map
  val flattenedAndMapped = arrTuples.flatMap(n=>n.map(_*100))
  println(flattenedAndMapped)
  val fruits = Seq("apple","banana","pear")
  println(fruits.map(_.toUpperCase))
  println(fruits.flatMap(_.toUpperCase))

  val dupeInternalItems = arrTuples.flatMap(list => list.concat(list))
  println(dupeInternalItems.toList)

  val allLessThan100 = duplicateNumbers.forall(_<100)
  //returns true if all of them are less the 100
  println(allLessThan100)

  //foreach can be used for side effects such as println
  duplicateNumbers.foreach(n=>println(s"Number is $n"))

  // so groupby takes a collection and groups it according to function we provide

  val evenOdd = numbers.groupBy(_%2)
  //works slightly different on negative numbers
  for ((key, value) <- evenOdd) {
    println(s"Reminder $key -> ${value.toList}")
  }
  val moreFruits = fruits ++ Seq("peaches", "oranges")
  println(moreFruits)

  val groopByLen = moreFruits.groupBy(_.length)
  for ((key, value)<- groopByLen) {
    println(s"Length $key -> ${value.toList}")
  }
}
