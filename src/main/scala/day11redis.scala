import com.redis.RedisClient

object day11redis extends App {

  val port = 10032
  val url = scala.util.Properties.envOrElse("REDISHOST","nodatabaseurl")
  //val url = "redis-10032.c8.us-east-1-4.ec2.cloud.redislabs.com"
  val dbName = "Marijka-free-db"

  val pw = Some(scala.util.Properties.envOrElse("REDISPW", "nodatabasepw"))

  val r = new RedisClient(host = url, port, 0, secret = pw)
  r.set("computer:type", "Lenovo" )

  val myValues = r.mget("myname", "mycount", "number", "favorites:berry").getOrElse(List[Option[String]]())

  for (value <- myValues) {
    println(s"Value -> ${value.getOrElse((""))}")
  }

  val msetResults = r.mset(("weather", "sunny"), ("temperature", 25), ("favorites:berry", "strawberies"))
  println(s"Mset worked?: $msetResults")

  val keys = r.keys().getOrElse(List[String]())
  keys.foreach(key => println(s"Key $key type is ${key.getClass} value: ${key.getClass}"))
//set key - user:42, it has fields name, likes, color with corresponding values
  r.hmset("user:42", Array(("name", "Marija"), ("likes", "avocado"), ("color", "blue"), ("age", 20)))

  val myName = r.hget("user:42", "name").getOrElse("")
  println(myName)

  var age = r.hget("user:42", "age").getOrElse("0").toInt
   r.hincrby("user:42", "age", 10)
  age = r.hget("user:42", "age").getOrElse("0").toInt
  println((s"Next age $age"))
   //sorted set

  r.zadd("hackers", 1940, "Alan Key")
  r.zadd("hackers", 1957, "Sophie Wilson")
  r.zadd("hackers", 1912, "Alan Turing")
  r.zadd("hackers", 1969, "Linus Torvalds")

  val hackers = r.zrange("hackers", 0, -1).getOrElse(List[String]())
  println(hackers.mkString(","))

  r.hmset("user:33", Array(("name", "Nikita"), ("likes", "french fries"), ("color", "black"), ("age", 23)))
  val newName = r.hget("user:33", "name").getOrElse("")
  println(newName)
  val newAge = r.hget("user:33", "age").getOrElse("0").toInt
  println(newAge)
  val favouriteFood = r.hget("user:33", "likes").getOrElse("")
  println(favouriteFood)

  r.zadd("hackers", 1960, "Mom")
  r.zadd("hackers", 1963, "Dad")
  r.zadd("hackers", 1965, "Aunt")
  val hackersAfter1960 = r.zrangebyscore("hackers", 1960,true, 2000, true, Option(0,100)).getOrElse(List[String]())
  println(hackersAfter1960.mkString(","))



}

