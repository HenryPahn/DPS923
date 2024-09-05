//
//  main.swift
//  Week01
//
//  Created by Andrew Trinh on 2024-09-05.
//

import Foundation

//------------------------------
// w1s1
var x = 30 // writeable variable
print("x = ", x)

x = 20
print("Changed x = ", x)

let y = 50 // constant variable
print("y = ", y)

// Explicit variable declaration
let a:Int = 4
let b:Double = 5.5
let c:String = "Henry"
let d:Bool = true

// Getting variable data type
print(type(of: a))
print(type(of: b))
print(type(of: c))
print(type(of: d))

// String interpolation and Concatenation
let name:String = "Henry"
let age:Int = 21
print("Hello, my name is \(name) and I am \(age) years old.")
print("Hello, my name is", name, "and I am", age, "years old.")
print("Hello, my name is " + name + "and I am " + String(age) + "years old.")

//------------------------------
// w1s2
let slices:Int = 14
let people:Int = 4

if (slices % people == 0) {
    print("no slices left")
} else {
    print("yes slices left")
}

// loop from 0 to 4
for i in 0...4 {
    print("Looping", i)
}

// loop from 10 to 14
for i in 10..<15 {
    print("Looping", i)
}

// loop from 67 to 62
for i in (62...67).reversed() {
    print("Reversed loop ", i)
}


// static list, unchangeable
let schools:[String] = ["Seneca", "Humber", "George"]

// dynamic list
var cities:[String] = ["toronto", "Calgary", "Vancouver", "Edmonton"]

// size of the list
print("Number of schools", schools.count)
print("Number of cities", cities.count)

// display list
for city in cities {
    print(city)
}

// append to the list
cities.append("London")

// remove from the list
cities.remove(at: 0)

// remove all from the list
cities.removeAll()

for city in cities {
    print(city)
}

