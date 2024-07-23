//
//  ExpenseView.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//

import SwiftUI

struct ExpenseView: View {
    @State private var date = Date()
    @State private var totalCost = ""
    @State private var selectedExpenseType = ""
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @State private var showAlert = false
    
    var body: some View {
        Form {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            HStack {
                TextField("Total Cost", text: $totalCost)
                    .keyboardType(.decimalPad)
                Text("₾")
            }
            Picker("Expense Type", selection: $selectedExpenseType) {
                ForEach(expenseViewModel.expenseTypes, id: \.self) { type in
                    Text(type)
                }
            }
            
            Button(action: {
                let details = "Date: \(date), Total Cost: \(totalCost) ₾, Expense Type: \(selectedExpenseType)"
                let item = HistoryItem(type: "Expense", details: details)
                historyViewModel.addHistoryItem(item)
                showAlert = true
            }) {
                Text("Save")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Added Successfully"), dismissButton: .default(Text("OK")) {
                    
                })
            }
        }
        .onAppear {
            expenseViewModel.fetchExpenseTypes()
        }
        .navigationTitle("Expense")
    }
}
