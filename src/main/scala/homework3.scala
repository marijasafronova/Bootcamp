

object homework3 extends App {

  def areParenthesisMatching(text:String):Boolean = {
//    val stack = scala.collection.mutable.Stack[Char]()
//    var rCount = 0
//    var lCount = 0
//    for (ch <- text)  stack.push(ch)
//    if (stack.head == ')' || stack(stack.size-1) == '(')
//      false
//    else {
//      for (el <- stack) {
//        if (el == '(') lCount = lCount + 1
//        else if (el == ')') rCount = rCount + 1
//      }
//    }
//      if (rCount == lCount) true
//      else false
//    }
    var rCount = 0
    var lCount = 0
    if (text.head == ')'|| text(text.size-1) == '(')
      return false
    else {
       for (ch <- text)
           if (ch == '(') lCount=lCount+1
            else if (ch == ')') rCount=rCount+1
    }
    if (rCount == lCount) true
      else false
  }

  print(areParenthesisMatching("()()"))

}
