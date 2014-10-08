// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

func rotate (inout array: [Int], steps: Int) {
    var newArray: [Int] = Array(count: array.count, repeatedValue: 0)
    for var i = 0; i < array.count; i++ {
        newArray[(i+steps)%array.count] = array[i]
    }
    array = newArray
}


//create a URL object. This object is passed into the URLSession which will make an HTTP request to the server and get the data we want
//var url = NSURL(string: "http://buckheit.com/smallestdata.txt")
var url = NSURL(string: "http://buckheit.com/smalldata.txt")
//var url = NSURL(string: "http://buckheit.com/bigdata.txt")

let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
    //get Input data from website
    var returnedString = NSString(data: data, encoding: NSUTF8StringEncoding)
    
    //convert one string of input into an array of integers to pass into the array rotate method. Look at the methods of NSString to find a method which can split a string into its components separated by a given string.
    var array = returnedString.componentsSeparatedByString(" ")
    
    //loop through the components of the array you just made and convert them to an Int array
    var newIntArray: [Int] = array.map({ (thing) -> Int in
        (thing as String).toInt()!
    })
    
    newIntArray
    
    
    //pass your new array into your rotate method with any number of steps.
    rotate(&newIntArray, 1304947392328)
    
    newIntArray
})

//run the URL request. This is an asynchronus opertation and must be started this way.
task.resume()


var input: [Int] = [1,2,3,4,5]
rotate(&input, 3)
