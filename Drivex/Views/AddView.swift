//
//  AddView.swift
//  Drivex
//
//  Created by Alex Saroyan on 20.07.24.
//
import SwiftUI

struct AddView: View {
    @AppStorage("carSelected") private var carSelected: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            if carSelected {
                HStack(spacing: 20) {
                    NavigationLink(destination: RefuelingView()) {
                        createBanner(imageName: "Refuelling", text: "Refueling")
                    }
                    NavigationLink(destination: CarWashView()) {
                        createBanner(imageName: "Car Wash", text: "Car Wash")
                    }
                }
                
                HStack(spacing: 20) {
                    NavigationLink(destination: ExpenseView()) {
                        createBanner(imageName: "Expense", text: "Expense")
                    }
                    NavigationLink(destination: ServiceView()) {
                        createBanner(imageName: "Service", text: "Service")
                    }
                }
                
                NavigationLink(destination: RemindersView()) {
                    createBanner(imageName: "Reminder", text: "Reminder")
                }
            } else {
                NavigationLink(destination: CarSelectionView()) {
                    Text("Select Car")
                }
            }
        }
        .padding()
        .navigationTitle("Choose")
    }
    
    private func createBanner(imageName: String, text: String) -> some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .overlay(
                VStack {
                    Text(text)
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.top, 10)
                        .padding(.horizontal, 5)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(5)
                        .padding([.top, .leading, .trailing], 10)
                    Spacer()
                }
            )
            .cornerRadius(8)
    }
}
