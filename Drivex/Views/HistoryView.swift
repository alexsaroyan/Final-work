//
//  HistoryView.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        List {
            ForEach(historyViewModel.historyItems) { item in
                VStack(alignment: .leading) {
                    Text(item.type)
                        .font(.headline)
                    Text(item.details)
                }
            }
        }
        .navigationTitle("History")
    }
}
