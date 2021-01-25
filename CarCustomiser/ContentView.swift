//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Marinov, Zachary (Coll) on 20/01/2021.
//

import SwiftUI

//view is a struct so can contain attributes and methods
struct ContentView: View {
    //brackets as you want a new one, not the whole struct
    @State private var starterCars = StarterCars()
    //@State says that this variable influences the view - so any time it is updated, the view will be updated
    //worth making private because this will only be used by this view
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var gearsPackage = false
    @State private var supremePackage = false
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    
    var isExhaustPackageEnabled: Bool {
        //ternary operator - X ? <what to do if true> ! <what to do if it's false> (no <> needed)
        return (remainingFunds >= 500 || exhaustPackage == true) && (remainingTime > 0)
        
    }
    var isTiresPackageEnabled: Bool {
        return (remainingFunds >= 500 || tiresPackage == true) && (remainingTime > 0)
    }
    var isGearsPackageEnabled: Bool {
        return (remainingFunds >= 500 || gearsPackage == true) && (remainingTime > 0)
    }
    var isSupremePackageEnabled: Bool {
        return (remainingFunds >= 1000 || supremePackage == true) && (remainingTime > 0)
    }
    
    var isNextCarButtonEnabled: Bool {
        return (remainingTime > 0)
    }
    
    //gives regular timing signals for use in the countdown timer
    let timer = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    
    //this must return something of type View
    var body: some View {
        
        //new binding
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                
                //update car with stats
                
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
        //new binding
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                
                //update car with stats
                
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        //new binding
        let gearsPackageBinding = Binding<Bool> (
            get: { self.gearsPackage },
            set: { newValue in
                self.gearsPackage = newValue
                
                //update car with stats
                
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 2
                    remainingFunds += 500
                }
            }
        )
        
        //new binding - this is how you write your own binding
        let supremePackageBinding = Binding<Bool> (
            get: { self.supremePackage },
            set: { newValue in
                self.supremePackage = newValue
                
                //update car with stats
                
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 3
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].acceleration -= 1
                    
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 3
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].acceleration += 1
                    
                    remainingFunds += 1000
                }
            }
        )
        VStack {
            
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    } else {
                        resetDisplay()
                    }
                }
                .foregroundColor(.red)
            
            Form {
                
                //some View is only one view i.e. body can only return one view and Button and Text are separate views, so you need VStack
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar = (selectedCar + 1) % self.starterCars.cars.count
                        resetDisplay()
                    }).disabled(!isNextCarButtonEnabled)
                }
                Section {
                    
                    //$ means that exhaustPackage becomes of type "Binding", so it can be modified through the toggle or as a raw variable in the program
                    
                    Toggle("Exhaust Package (cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!isExhaustPackageEnabled)
                    Toggle("Tires Package (cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!isTiresPackageEnabled)
                    Toggle("Gears Package (cost: 500)", isOn: gearsPackageBinding)
                        .disabled(!isGearsPackageEnabled)
                    Toggle("Supreme Package (cost: 1000)", isOn: supremePackageBinding)
                        .disabled(!isSupremePackageEnabled)
                }
            }
            //because this is outside of the form (which can be scrolled through), it's position at the bottom of the screen is fixed
            
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20.0)
        }
    }
    func resetDisplay() {
        //turn off toggles
        exhaustPackage = false
        tiresPackage = false
        gearsPackage = false
        supremePackage = false
        
        //reset values in starterCars
        starterCars = StarterCars()
        //reset funds
        remainingFunds = 1000
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
