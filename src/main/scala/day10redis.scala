import com.redis.RedisClient

object day10redis extends App {

  val port = 10032
  val url = "redis-10032.c8.us-east-1-4.ec2.cloud.redislabs.com"
  val dbName = "Marijka-free-db"


  val pw = Some("qwerty12345")

  val r = new RedisClient(url, port, 0, pw)

  r.set("myname", "Marija")
  r.incr("mycount")
  println((r.get("myname")))
  val myCounter = r.get("mycount")
  println(s"My counter is at $myCounter")

  val number = r.get("number", 50)
  r.decrby((number), 2)
  println(number)



}
