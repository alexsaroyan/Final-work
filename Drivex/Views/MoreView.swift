//
//  MoreView.swift
//  Drivex
//
//  Created by Alex Saroyan on 20.07.24.
//
import SwiftUI

struct MoreView: View {
    @AppStorage("distanceUnit") var distanceUnit: DistanceUnit = .km
    @AppStorage("currencyUnit") var currencyUnit: CurrencyUnit = .gel
    @AppStorage("volumeUnit") var volumeUnit: VolumeUnit = .liters
    @AppStorage("appAppearance") var appAppearance: AppAppearance = .light

    var body: some View {
        Form {
            Section(header: Text("Units")) {
                Picker("Distance Unit", selection: $distanceUnit) {
                    Text("Kilometers").tag(DistanceUnit.km)
                    Text("Miles").tag(DistanceUnit.miles)
                }
                Picker("Currency Unit", selection: $currencyUnit) {
                    Text("₾").tag(CurrencyUnit.gel)
                    Text("$").tag(CurrencyUnit.usd)
                }
                Picker("Volume Unit", selection: $volumeUnit) {
                    Text("Liters").tag(VolumeUnit.liters)
                    Text("Gallons").tag(VolumeUnit.gallons)
                }
            }
            Section(header: Text("Appearance")) {
                Picker("Appearance", selection: $appAppearance) {
                    Text("Light").tag(AppAppearance.light)
                    Text("Dark").tag(AppAppearance.dark)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Settings")
        .environment(\.colorScheme, appAppearance == .light ? .light : .dark)
    }
}

enum DistanceUnit: String, CaseIterable {
    case km, miles
    
    var symbol: String {
        switch self {
        case .km: return "km"
        case .miles: return "mi"
        }
    }
}

enum VolumeUnit: String, CaseIterable {
    case liters, gallons
    
    var symbol: String {
        switch self {
        case .liters: return "liters"
        case .gallons: return "gal"
        }
    }
}

enum CurrencyUnit: String, CaseIterable {
    case gel, usd
    
    var symbol: String {
        switch self {
        case .gel: return "₾"
        case .usd: return "$"
        }
    }
}


enum AppAppearance: String {
    case light, dark
}
