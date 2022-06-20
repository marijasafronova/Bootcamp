object Day4CollectExercise {
    println("Day 4 Exercise on Partial Functions and collect")
    //TODO write two partial functions
    //getEvenSquare applies to only positive even numbers  -> returns square
    //getOddCube applies to only positive odd numbers -> returns cube

  val getEvenSquare = new PartialFunction[Int, Int]   {
    def apply(x: Int): Int = x*x
    def isDefinedAt(x: Int): Boolean = x%2 == 0 && x>0
  }

  val getOddCube = new PartialFunction[Int, Int]   {
    def apply(x: Int): Int = x*x*x
    def isDefinedAt(x: Int): Boolean = x%2 != 0 && x>0
  }
  //combine both partial functions into a single partial function
  val doPositives = getEvenSquare orElse getOddCube

    //doPositives will work on positive numbers
    val numbers = (-5 to 28).toArray
    //using collect get the new values into
    //TODO
    val processedNumbers = numbers collect doPositives
    //println the results
  println(processedNumbers.mkString(" "))

}
