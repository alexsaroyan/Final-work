//
//  AddOptionsView.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//

import SwiftUI

struct AddOptionsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: RefuelingView()) {
                    Text("Refueling")
                }
                NavigationLink(destination: CarWashView()) {
                    Text("Car Wash")
                }
                NavigationLink(destination: ExpenseView()) {
                    Text("Expense")
                }
                NavigationLink(destination: ServiceView()) {
                    Text("Service")
                }
                NavigationLink(destination: RemindersView()) {
                    Text("Reminder")
                }
            }
            .navigationTitle("Add Options")
        }
    }
}
