import scala.util.Random

object day3 extends App {

  //rarer scala collections
  // Array us the most basic data structure, it is
  //one long block of memory by indexes for that particular dat types
  //for access by keyword we use Map
  //for Uniques- set
  val seqSize = 1000000
  val maxNumber = 100000000

  val arr = (0 to seqSize).toArray
  val v1 = (0 to seqSize).toVector
  val list = (0 to seqSize).toList
  val seq = (0 to seqSize).toSeq

  val randomArray = arr.map(_ => Random.nextInt(maxNumber))
  val randomVector = arr.map(_ => Random.nextInt(maxNumber))
  val randomList = arr.map(_ => Random.nextInt(maxNumber))
  val randomSeq = (0 to seqSize).map(_ => Random.nextInt(maxNumber))

  println(randomArray.take(10).mkString(","))
  println(randomVector.take(10))
  println(randomList.take(10))
  println(randomSeq.take(10))

  val sortedArray = randomArray.sorted
  val sortedVector = randomVector.sorted
  val sortedSeq = randomSeq.sorted

  val beg = 1_000
  val end = 30_000
  val increment = 10_000

  val slicedVector = randomVector.slice(beg, end).map(_+increment)

  //=================================================================================================

  val queue = scala.collection.immutable.Queue.empty
  val addOne = queue.enqueue(3424)
  val addAnother = addOne.enqueue(43242)
  println(addOne.dequeue) //????

  val mutQueue = scala.collection.mutable.Queue[Int]()
  mutQueue.enqueue(43,3423,62525)
  println(mutQueue)
  val firstOne = mutQueue.dequeue()
  println(firstOne)
  println(mutQueue.head)
  println(mutQueue)
  // so .head just returns the first value, while dequeue()
  // returns and removes the value for queue

  val stack = scala.collection.mutable.Stack[Int]()
  println(s"Stack size is ${stack.size}")
  stack.push(434)
  stack.push(4345)
  stack.push(4334)
  println(stack) // prints the last entered value first
  val popped = stack.pop()
  println(stack)
  println(stack.head)

  for (n <- randomArray) stack.push(n)

  println(stack.size)
}