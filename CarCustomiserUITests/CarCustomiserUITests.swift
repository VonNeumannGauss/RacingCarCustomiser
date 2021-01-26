//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Marinov, Zachary (Coll) on 20/01/2021.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //verbose names are good because they tell you what's happening
    func testWhenBoughtTiresAndExhaustPackageOtherPackagesDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act (the form creates tables) (created by the recording feature!)
        let tablesQuery = app.tables
        //each of these gives something called "XCUIElement" (not including the.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (cost: 500)"]/*[[".cells[\"Exhaust Package (cost: 500)\"].switches[\"Exhaust Package (cost: 500)\"]",".switches[\"Exhaust Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package (cost: 500)"]/*[[".cells[\"Tires Package (cost: 500)\"].switches[\"Tires Package (cost: 500)\"]",".switches[\"Tires Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Gears Package (cost: 500)"]/*[[".cells[\"Gears Package (cost: 500)\"].switches[\"Gears Package (cost: 500)\"]",".switches[\"Gears Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Supreme Package (cost: 1000)"]/*[[".cells[\"Supreme Package (cost: 1000)\"].switches[\"Supreme Package (cost: 1000)\"]",".switches[\"Supreme Package (cost: 1000)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        
    }
    
    func testWhenSupremePackageBoughtOtherPackagesDisabled() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Supreme Package (cost: 1000)"]/*[[".cells[\"Supreme Package (cost: 1000)\"].switches[\"Supreme Package (cost: 1000)\"]",".switches[\"Supreme Package (cost: 1000)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Exhaust Package (cost: 500)"]/*[[".cells[\"Exhaust Package (cost: 500)\"].switches[\"Exhaust Package (cost: 500)\"]",".switches[\"Exhaust Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package (cost: 500)"]/*[[".cells[\"Tires Package (cost: 500)\"].switches[\"Tires Package (cost: 500)\"]",".switches[\"Tires Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Gears Package (cost: 500)"]/*[[".cells[\"Gears Package (cost: 500)\"].switches[\"Gears Package (cost: 500)\"]",".switches[\"Gears Package (cost: 500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, false)
        
    }
    
    func testWhenButtonPressedNewCarPresent() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        app.tables/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Manufacturer: Mazda \\nModel: MZ-5 \\nTop speed: 125mph \\nAcceleration (0-60): 7.7s \\nHandling: 5, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //assert
        
        //how to query what is in a particular location??????
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
