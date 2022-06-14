import scala.io.StdIn.readLine

object homework2 extends App {
  val userNumber = readLine("User, please enter the number").toInt

  val numbers = (1 to userNumber).toArray

  def multiplication(x:Int, y: Int) = x*y

  val result = (numbers.view.map(n => n*n)).filter(n => n%2 == 1).reduce(multiplication)
  println(result)
}
