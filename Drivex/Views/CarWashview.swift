//
//  CarWashview.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//

import SwiftUI

struct CarWashView: View {
    @State private var date = Date()
    @State private var totalCost = ""
    @State private var place = ""
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @State private var showAlert = false

    var body: some View {
        Form {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            HStack {
                TextField("Total Cost", text: $totalCost)
                    .keyboardType(.decimalPad)
                Text("₾")
            }
            TextField("Place", text: $place)

            Button(action: {
                let details = "Date: \(date), Total Cost: \(totalCost) ₾, Place: \(place)"
                let item = HistoryItem(type: "Car Wash", details: details)
                historyViewModel.addHistoryItem(item)
                showAlert = true
            }) {
                Text("Save")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Added successfully"), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Car Wash")
    }
}
