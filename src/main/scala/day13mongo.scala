import org.mongodb.scala.model.Filters
import org.mongodb.scala.model.Filters.{and, equal, or}
import org.mongodb.scala.{Document, MongoClient, MongoDatabase}

import scala.collection.mutable.ArrayBuffer

object day13mongo extends App{

  val userName = scala.util.Properties.envOrElse("MongoDBuser","nothing")
  val password = scala.util.Properties.envOrElse("MongoDBpw","nothing")

  val uri: String = s"mongodb+srv://$userName:$password@cluster0.g9ynt.mongodb.net/?retryWrites=true&w=majority"
  val client: MongoClient = MongoClient(uri)
  val db: MongoDatabase = client.getDatabase("sample_restaurants")

  val collectionName = "restaurants"
  val collection = db.getCollection(collectionName)

  val resultsBuffer = ArrayBuffer[Document]()

//  val allRestaurants = collection.find
//    .subscribe(
//      (doc: Document) => {
//        resultsBuffer += doc
//      },
//      (e: Throwable) => println(s"Query error: $e"),
//      afterQuerySuccess //
  //      )

//  val statenIslandRestaurants = collection.find(equal("borough", "Staten Island"))
//    .subscribe(
//      (doc: Document) => {
//        resultsBuffer += doc
//      },
//      (e: Throwable) => println(s"Query error: $e"),
//      afterQuerySuccess
//    )

//  val allRestaurants = collection.find(and(gte("address.building", "3000")))
//    .subscribe(
//      (doc: Document) => {
//        resultsBuffer += doc
//      },
//      (e: Throwable) => println(s"Query error: $e"),
//      afterQuerySuccess
//    )

//    val allRestaurants = collection.find(Filters.regex("name", ".*Kosher.*"))
//      .subscribe(
//        (doc: Document) => {
//          resultsBuffer += doc
//        },
//        (e: Throwable) => println(s"Query error: $e"),
//        afterQuerySuccess
//      )


  val firstRestaurant = collection.find().first().toString
  println(firstRestaurant)

//  sleep(6600)
//  client.close()

  //Task
    val BBqRestaurants = collection.find(and(equal("borough", "Manhattan"),
  or(Filters.regex("name", ".*Barbeque.*"),
     equal("cuisine", "Barbecue"))))
      .subscribe(
        (doc: Document) => {
          resultsBuffer += doc
        },
        (e: Throwable) => println(s"Query error: $e"),
        afterQuerySuccess
      )


  def afterQuerySuccess() = {
    println("Closing after last query")
    val allRestaurants = resultsBuffer.toArray
    println(s"We got ${allRestaurants.length} restaurants")
    println("First and last restaurant")
    println(allRestaurants.head.toJson())
    println(allRestaurants.last.toJson())
    val savePath = "src/resources/json/restaurants.json"
    val restaurantsInJSON = allRestaurants.map(_.toJson())
    Util.saveLines(savePath, restaurantsInJSON)

    client.close()
  }

}
