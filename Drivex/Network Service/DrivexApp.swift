//
//  DrivexApp.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI

@main
struct DrivexApp: App {
    @StateObject private var historyViewModel = HistoryViewModel()
    @StateObject private var serviceViewModel = ServiceViewModel()
    @StateObject private var expenseViewModel = ExpenseViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(historyViewModel)
                .environmentObject(serviceViewModel)
                .environmentObject(expenseViewModel)
                .applyAppearance()
        }
    }
}
