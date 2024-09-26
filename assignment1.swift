//
//  main.swift
//  Assignment1
//
//  Created by Andrew Trinh on 2024-09-25.
//

import Foundation

class Customer: CustomStringConvertible {
    let name: String       // name of customer, and cannot be changed
    var city: String       // customer's city
    var creditCard: Int?   // customer's credit card, only 4 digits, and nullable
    
    var email: String {    // return customer's email, and all lowercase letter
        return "\(name.lowercased())@gmail.com"
    }
    
    var description: String { // return the string representing the class, and must be inherited from the CustomSTringConvertible protocol
        return "Name: \(name) \nEmail: \(email) \nCity: \(city) \n\(creditCard != nil ? "Credit Card: \(creditCard!)" : "No Credit Card provided")"
    }
    
    // Initializer, using default value instead of writing an extra constructor
    init(name: String, city: String, creditCard: Int? = nil) {
        self.name = name
        self.city = city
        self.creditCard = creditCard
    }
}

class RoomReservation {
    var customer: Customer   // customer, and type is Customer class
    var dailyRate: Double    // the daily rate for the room
    var numDays: Int         // the number of days the room is reserved
    var taxRate: Double {    // returns the tax rate applied to the reservation
        if(customer.city == "New York City") {  // for New York City, 5.875%
            return 5.875 / 100
        }
        return 2 / 100       // for the rest city, 2%
    }
    
    var roomCost: Double {   // return the cost of the rum
        return dailyRate * Double(numDays)
    }
    
    var occupancyTax: Double { // return the tax on the room
        return roomCost * taxRate
    }
    var total: Double {      // return the total cost of the reservation
        return roomCost + occupancyTax
    }
    
    // initializer
    init(customer: Customer, dailyRate: Double, numDays: Int) {
        self.customer = customer
        self.dailyRate = dailyRate
        self.numDays = numDays
    }
    
    // method to display an invoice for the reservation
    func printInvoice() {
        print("===================")
        print("===== INVOICE =====")
        print("===================")
        print("---Customer Details---")
        print(customer)
        print("---Room Details---")
        print("Daily Rate: $", dailyRate)
        print("Length of stay: \(numDays) days")
        print("Subtotal: $\(roomCost)")
        print("Tax (\(taxRate)%): $\(occupancyTax)")
        print("Total: $\(total)")

    }
}

class ConferenceRoomReservation: RoomReservation {
    var eventName: String                       // the name of the event
    var numAttendees: Int                       // number of people attending the event
    var additionalServices: [String: Double]?   // A dictionary that represent the additional serives
    
    override var roomCost: Double {             // override the roomCost for a event
        return super.roomCost * Double(numAttendees)
    }
    
    override var total: Double {                // Override the parent property and calculates the total cost of the reservation
        var serviceCost: Double = 0
        for i in additionalServices! {
            serviceCost += i.value
        }
        
        return super.total + serviceCost
    }
    
    // Initiallizer
    init(eventName: String, numAttendees: Int, additionalServices: [String : Double]? = [:], numDays: Int, customer: Customer) {
        self.eventName = eventName
        self.numAttendees = numAttendees
        self.additionalServices = additionalServices
        
        super.init(customer: customer, dailyRate: 105.0, numDays: numDays)
    }
    
    // Method to add service to the reservation
    func addService(serviceName: String, cost: Double) {
        if additionalServices![serviceName] == nil {
            additionalServices?[serviceName] = cost
        }
    }
    
    // Overrided method to print the invoice of the reservation
    override func printInvoice() {
        print("===================")
        print("===== INVOICE =====")
        print("===================")
        print("---Customer Details---")
        print(customer)
        print("---Event Details---")
        print("Event Name: \(eventName)")
        print("Length: \(numDays) days")
        print("Attendees: \(numAttendees)")
        print("Room Cost: $\(roomCost)")
        print("Occupancy Tax (\(taxRate)%): $\(occupancyTax)")
        print("Additional Services:")
        for i in additionalServices! {
            print(" + \(i.key): $\(i.value)")
        }
        print("Total: $\(total)")
    }
}


let customer1: Customer = Customer(name: "Fatima", city: "New York City", creditCard: 1001)
let customer2: Customer = Customer(name: "Wen", city: "Montreal")

print(customer1)
print(customer2)

let roomReservation1: RoomReservation = RoomReservation(customer: customer2, dailyRate: 341.5, numDays: 3)
roomReservation1.printInvoice()

let conferenceRoomReservation1: ConferenceRoomReservation = ConferenceRoomReservation(eventName: "Toronto Anime Festival", numAttendees: 35, numDays: 2, customer: customer1)
conferenceRoomReservation1.addService(serviceName: "Catering", cost: 1375.99)
conferenceRoomReservation1.addService(serviceName: "Catering", cost: 1375.99)
conferenceRoomReservation1.addService(serviceName: "A/V Equipment", cost: 250.0)
conferenceRoomReservation1.addService(serviceName: "Printing SErvices", cost: 80.5)
conferenceRoomReservation1.printInvoice()
