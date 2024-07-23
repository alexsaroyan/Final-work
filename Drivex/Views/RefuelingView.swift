//
//  RefuelingView.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI

struct RefuelingView: View {
    @State private var date = Date()
    @State private var odometer = ""
    @State private var litres = ""
    @State private var totalCost = ""
    @State private var place = ""
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @AppStorage("currencyUnit") private var currencyUnit: CurrencyUnit = .gel
    @AppStorage("distanceUnit") private var distanceUnit: DistanceUnit = .km
    @AppStorage("volumeUnit") private var volumeUnit: VolumeUnit = .liters
    @State private var showAlert = false

    var body: some View {
        Form {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            HStack {
                TextField("Odometer", text: $odometer)
                    .keyboardType(.numberPad)
                Text(distanceUnit.symbol)
            }
            HStack {
                TextField("Litres", text: $litres)
                    .keyboardType(.decimalPad)
                Text(volumeUnit.symbol)
            }
            HStack {
                TextField("Total Cost", text: $totalCost)
                    .keyboardType(.decimalPad)
                Text(currencyUnit.symbol) 
            }
            TextField("Place", text: $place)
            
            Button(action: {
                let details = "Date: \(date), Odometer: \(odometer) \(distanceUnit.symbol), Litres: \(litres) \(volumeUnit.symbol), Total Cost: \(totalCost) \(currencyUnit.symbol), Place: \(place)"
                let item = HistoryItem(type: "Refueling", details: details)
                historyViewModel.addHistoryItem(item)
                showAlert = true
            }) {
                Text("Save")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Added Successfully"), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Refueling")
    }
}
