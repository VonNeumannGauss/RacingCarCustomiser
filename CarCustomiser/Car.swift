//
//  Car.swift
//  CarCustomiser
//
//  Created by Marinov, Zachary (Coll) on 20/01/2021.
//

import Foundation
//advantage of using a struct is that when you pass in values, they're automatically initialized and set 
struct Car {
    let company: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return "Manufacturer: \(company) \nModel: \(model) \nTop speed: \(topSpeed)mph \nAcceleration (0-60): \(acceleration)s \nHandling: \(handling)"
    }
}
