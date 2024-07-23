//
//  ServiceView.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//
import SwiftUI

struct ServiceView: View {
    @State private var date = Date()
    @State private var odometer = ""
    @State private var totalCost = ""
    @State private var place = ""
    @State private var selectedService = ""
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @ObservedObject var viewModel = CarViewModel()
    @AppStorage("currencyUnit") private var currencyUnit: CurrencyUnit = .gel
    @AppStorage("distanceUnit") private var distanceUnit: DistanceUnit = .km
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
                TextField("Total Cost", text: $totalCost)
                    .keyboardType(.decimalPad)
                Text(currencyUnit.symbol) 
            }
            TextField("Place", text: $place)
            
            Picker("Service Type", selection: $selectedService) {
                ForEach(viewModel.serviceTypes, id: \.self) { service in
                    Text(service).tag(service)
                }
            }
            
            Button(action: {
                let details = "Date: \(date), Odometer: \(odometer) \(distanceUnit.symbol), Total Cost: \(totalCost) \(currencyUnit.symbol), Place: \(place), Service: \(selectedService)"
                let item = HistoryItem(type: "Service", details: details)
                historyViewModel.addHistoryItem(item)
                showAlert = true
            }) {
                Text("Save")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Added Successfully"), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Service")
        .onAppear {
            viewModel.fetchServiceTypes()
        }
    }
}
