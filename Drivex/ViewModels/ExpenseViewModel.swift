//
//  ExpenseViewModel.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//

import SwiftUI
import Combine

class ExpenseViewModel: ObservableObject {
    @Published var expenseTypes: [String] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchExpenseTypes() {
        NetworkService.shared.fetchExpenseTypes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching expense types: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] types in
                self?.expenseTypes = types
            })
            .store(in: &cancellables)
    }
}
