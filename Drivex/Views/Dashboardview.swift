//
//  Dashboardview.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab = 2 
    @AppStorage("distanceUnit") var distanceUnit: DistanceUnit = .km
    @AppStorage("currencyUnit") var currencyUnit: CurrencyUnit = .gel
    @AppStorage("volumeUnit") var volumeUnit: VolumeUnit = .liters

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                HistoryView()
            }
            .tabItem {
                Label("History", systemImage: "clock")
            }
            .tag(0)

            NavigationView {
                ReportsView()
            }
            .tabItem {
                Label("Reports", systemImage: "chart.bar")
            }
            .tag(1)

            NavigationView {
                AddView()
            }
            .tabItem {
                Label("Add", systemImage: "plus")
            }
            .tag(2)

            NavigationView {
                RemindersView()
            }
            .tabItem {
                Label("Reminders", systemImage: "bell")
            }
            .tag(3)

            NavigationView {
                MoreView()
            }
            .tabItem {
                Label("More", systemImage: "ellipsis")
            }
            .tag(4)
        }
        .applyAppearance()
    }
}
