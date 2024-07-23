//
//  ReportsView.swift
//  Drivex
//
//  Created by Alex Saroyan on 20.07.24.
//

import SwiftUI

struct ReportsView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    @State private var selectedPeriod = "Weekly"
    
    var body: some View {
        VStack {
            Picker("Period", selection: $selectedPeriod) {
                Text("Weekly").tag("Weekly")
                Text("Monthly").tag("Monthly")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            List {
                ForEach(historyViewModel.historyItems) { item in
                    VStack(alignment: .leading) {
                        Text(item.type)
                            .font(.headline)
                        Text(item.details)
                    }
                }
            }
            
            if selectedPeriod == "Weekly" {
                Text("Weekly Summary: \(calculateSummary(for: .weekly))")
            } else {
                Text("Monthly Summary: \(calculateSummary(for: .monthly))")
            }
        }
        .navigationTitle("Reports")
    }
    
    private func calculateSummary(for period: Period) -> String {
        
        let calendar = Calendar.current
        var totalCost: Double = 0.0
        
        for item in historyViewModel.historyItems {
            
            if let cost = extractCost(from: item.details), let date = extractDate(from: item.details) {
                if period == .weekly {
                    if calendar.isDateInCurrentWeek(date) {
                        totalCost += cost
                    }
                } else {
                    if calendar.isDateInCurrentMonth(date) {
                        totalCost += cost
                    }
                }
            }
        }
        
        return "\(totalCost)"
    }
    
    private func extractCost(from details: String) -> Double? {
        
        let components = details.components(separatedBy: ",")
        for component in components {
            if component.contains("Total Cost") {
                let costString = component.components(separatedBy: ":")[1].trimmingCharacters(in: .whitespaces)
                return Double(costString)
            }
        }
        return nil
    }
    
    private func extractDate(from details: String) -> Date? {
        
        let components = details.components(separatedBy: ",")
        for component in components {
            if component.contains("Date") {
                let dateString = component.components(separatedBy: ":")[1].trimmingCharacters(in: .whitespaces)
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                return formatter.date(from: dateString)
            }
        }
        return nil
    }
}

enum Period {
    case weekly, monthly
}

extension Calendar {
    func isDateInCurrentWeek(_ date: Date) -> Bool {
        return self.isDate(date, equalTo: Date(), toGranularity: .weekOfYear)
    }
    
    func isDateInCurrentMonth(_ date: Date) -> Bool {
        return self.isDate(date, equalTo: Date(), toGranularity: .month)
    }
}
