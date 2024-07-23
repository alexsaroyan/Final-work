//
//  ReminderView.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//
import SwiftUI

struct RemindersView: View {
    @State private var date = Date()
    @State private var reminderText = ""
    @State private var selectedReminderType = ""
    @EnvironmentObject var reminderViewModel: ReminderViewModel
    @EnvironmentObject var serviceViewModel: ServiceViewModel
    @State private var showAlert = false

    var body: some View {
        Form {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            TextField("Reminder", text: $reminderText)
            Picker("Reminder Type", selection: $selectedReminderType) {
                ForEach(serviceViewModel.serviceTypes, id: \.self) { type in
                    Text(type)
                }
            }
            
            Button(action: {
                let details = "Date: \(date), Reminder: \(reminderText), Reminder Type: \(selectedReminderType)"
                let item = ReminderItem(details: details)
                reminderViewModel.addReminderItem(item)
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
            serviceViewModel.fetchServiceTypes()
        }
        .navigationTitle("Reminder")
    }
}

class ReminderViewModel: ObservableObject {
    @Published var reminderItems: [ReminderItem] = []

    func addReminderItem(_ item: ReminderItem) {
        reminderItems.append(item)
    }
}

struct ReminderItem: Identifiable {
    let id = UUID()
    let details: String
}
