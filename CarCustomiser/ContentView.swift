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
    let starterCars = StarterCars()
    //@State says that this variable influences the view - so any time it is updated, the view will be updated
    //worth making private because this will only be used by this view
    @State private var selectedCar: Int = 0
    
    @State prviate var exhaustPackage = false
    
    //this must return something of type View
    var body: some View {
        //some View is only one view i.e. body can only return one view and Button and Text are separate views, so you need VStack 
        VStack(alignment: .leading, spacing: 20) {
            Text(starterCars.cars[selectedCar].displayStats())
            Button("Next Car", action: {
                selectedCar = (selectedCar + 1) % self.starterCars.cars.count
            })
            Toggle("Exhaust Package", isOn: <#T##Binding<Bool>#>)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
