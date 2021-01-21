//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Marinov, Zachary (Coll) on 20/01/2021.
//

import SwiftUI

//view is a struct so can contain attributes and methods
struct ContentView: View {
    let car = Car(company: "Mazda", model: "MZ-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    //this must return something of type View
    var body: some View {
        Text(car.displayStats())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
