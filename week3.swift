//
//  main.swift
//  Week 3
//
//  Created by Andrew Trinh on 2024-09-25.
//

import Foundation

// Section 1
// Inheritance
// Parent class
class Course{
    var course_name:String
    var course_code:Int
    
    init(course_name:String, course_code:Int){
        self.course_name = course_name
        self.course_code = course_code
    }
    
    func showDetails() {
        print("Course is " + self.course_name + String(self.course_code))
    }
}

// Child class
class Class:Course{
    var class_name:String
    private var noOfStudents:Int
    
    init(class_name:String, noOfStudents:Int){
        self.class_name = class_name
        self.noOfStudents = noOfStudents
        
        // using prefix and suffix to trim the string
        super.init(course_name: String(class_name.prefix(3)), course_code: Int(class_name.suffix(3))!) // using "!" to force unwrapping
        
    }
    
    // override an existed function from parent class
    override func showDetails(){
        super.showDetails()            // call the overidden from parents method
        print(self.noOfStudents)
    }
}
    
var BTP:Course = Course(course_name: "BTP", course_code: 200)
BTP.showDetails()

var BTP200:Class = Class(class_name: "BTP200", noOfStudents: 20)
BTP200.showDetails()


// SECTION 2
// In swift, the variable are non-nullable. We can't assign the null value to a variable
// Using "?" to make the variable nullable(nil)
var a: Int? = 10
a = nil

print(type(of: a))
