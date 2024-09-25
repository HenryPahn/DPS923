//
//  main.swift
//  Week 2
//
//  Created by Andrew Trinh on 2024-09-25.
//

import Foundation

print("Dictionary Demo")

// Section 1
// Declare a dictionary
// var <dict_name>:[<data_type>:<data_type>]=[<key_name>:<key_value>,]
var courses:[String: String] = [
    "Cloud": "DPS",
    "Data Structure": "DSA",
]

// Acess
print(courses["Cloud"])

// Modify
courses["Cloud"] = "DPS955"
print(courses["Cloud"])

// count the number of key value in dictionary
print(courses.count)

// check if the dict is empty
print(courses.isEmpty)

// get all the keys in dict
print(courses.keys)



// Create a function
func gretting(){
    print("Hello")
}

gretting()

func summation(a:Int, b:Int) ->Int {
    return a + b
}

print(summation(a:1, b:2))

func subtraction(a:Int, b:Int) ->Int {
    return a + b
}

print(subtraction(a:3, b:1))




// Section 2
// SWIFT OOP
class Course {
    // store properties
    var name:String
    var code:String
    
    // initializers
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
    
    // method
    func showCourse() {
        print(self.name + "'s code is " + self.code)
    }
}

// create an instance of a car
let c1:Course = Course(name: "Cloud Computing", code: "DPS955")

print("Name: ", c1.name)
print("Code: ", c1.code)
c1.showCourse()

// coumputed property
// TODO: Create a Circle with a radius and an area.  The area should be a computed property.
class Circle{
    // declare object variables
    var r:Double
    
    // computed property
    var area:Double {
        get{
            let res = r * r * 3.14
            return res
        }
    }
    
    // private property
    private var diameter:Double
    
    // initializers
    init(r:Double) {
        self.r = r
        self.diameter = self.r * 2
    }
}

let circle:Circle = Circle(r:2.3)




