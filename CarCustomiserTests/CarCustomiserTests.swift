//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Marinov, Zachary (Coll) on 20/01/2021.
//

import XCTest
//@testable import CarCustomiser

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeCarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(company: "Mazda", model: "MZ-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.company, "Mazda")
        XCTAssertEqual(car.model, "MZ-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        
    }
    
    func testCarGivesMeStats() {
        //arrange
        //act
        let car = Car(company: "Mazda", model: "MZ-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.displayStats(), "Manufacturer: Mazda \nModel: MZ-5 \nTop speed: 125mph \nAcceleration (0-60): 7.7s \nHandling: 5")
    }
    
}
