
object day2 {
  def main (args: Array[String]): Unit = {
    println ("Creating temporary views")

    val numbers = (0 to 12).toArray
    println(numbers.mkString(","))

    val squares = numbers.map(n => n*n)
    println(squares.mkString(","))
    val evenSquares = squares.filter(n => n%2 == 0)
    println(evenSquares.mkString(","))
    val firstEvenSquares = numbers.map(n => n*n).filter(n => n%2 == 0).take(3)
    println(firstEvenSquares.mkString(","))


    // correct way

    val oddCubes = numbers.view.map(n => n*n).filter(n => n%2 == 1).slice(0,5).takeRight(3).toArray
    println(oddCubes.mkString(","))

    val firstOver10 = numbers.find(n => n > 10)
    println(firstOver10.getOrElse(-1))
    val firstOver20 = numbers.find(n => n> 20)
    println(firstOver20.getOrElse(-1))

    val result = numbers.find(n => n < 0).getOrElse(-1)
    println(result)
    println(numbers.contains(3))

    val myCombinations = evenSquares.combinations(2).toArray
    for (combination <- myCombinations) {
      println(combination.mkString(","))
    }

    def add(x:Int, y:Int): Int = {
      val theSum = x+y
      println(s"received $x and $y, sum = $theSum")
      theSum
    }
  }

}