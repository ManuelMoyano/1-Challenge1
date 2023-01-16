//
//  ContentView.swift
//  Challenge1
//
//  Created by Manuel Moyano on 27/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var userImput = 0.0
    @State private var imputUnit = "m"
    @State private var outputUnit = "cm"
    
    let units = ["m","dm","cm","mm"]
    
    var baseValue: Double {
        let value = userImput
        let impUnit=imputUnit
        var base = 0.0
        switch impUnit {
        case "m":
            base = value*1000
        case "dm":
            base = value*100
        case "cm":
            base = value*10
        case "mm":
            base = value
        default:
            base = 0.0
        }
        return base
    }
    var convertValue: Double {
        let value = baseValue
        let outUnit=outputUnit
        var base = 0.0
        switch outUnit {
        case "m":
            base = value/1000
        case "dm":
            base = value/100
        case "cm":
            base = value/10
        case "mm":
            base = value
        default:
            base = 0.0
        }
        return base
    }
    
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField ("Value", value: $userImput, format: .number)
            } header:{
                Text("Insert Value to convert")
            }
            .keyboardType(.decimalPad)
            Section {
                Picker ("Original Unit", selection: $imputUnit) {
                    ForEach (units, id: \.self) {
                        Text ($0)
                    }
            }
            } header: {
                Text("Select Original Unit")
            }
            Section {
                Picker ("Select Unit", selection: $outputUnit) {
                    ForEach (units, id:\.self) {
                        Text ($0)
                    }
                }
            } header: {
                Text ("Select unit")
            }
            Section {
                Text (convertValue, format: .number)
            } header: {
                Text ("Convert Value")
        }
        
    }
}
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
