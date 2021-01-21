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
    var selectedCar: Int = 0
    
    //this must return something of type View
    var body: some View {
        //some View is only one view i.e. body can only return one view and Button and Text are separate views, so you need VStack 
        VStack {
            Text(starterCars.cars[selectedCar].displayStats())
                .padding()
            Button("Random Car", action: {
                print("Button pressed")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
