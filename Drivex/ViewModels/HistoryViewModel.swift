//
//  HistoryViewModel.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//
import SwiftUI
import Combine

class HistoryViewModel: ObservableObject {
    @Published var historyItems: [HistoryItem] = []
    
    func addHistoryItem(_ item: HistoryItem) {
        historyItems.append(item)
    }
}

struct HistoryItem: Identifiable {
    let id = UUID()
    let type: String
    let details: String
}
