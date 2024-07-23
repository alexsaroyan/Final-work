//
//  CarViewModel.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI
import Combine

class CarViewModel: ObservableObject {
    @Published var carMarks: [CarMake] = []
    @Published var carModels: [String] = []
    @Published var expenseTypes: [String] = []
    @Published var serviceTypes: [String] = []
    @Published var selectedMark: CarMake?
    @Published var selectedModel: String?
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchCarMarks() {
        NetworkService.shared.fetchCarMakes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching car marks: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] marks in
                self?.carMarks = marks
            })
            .store(in: &cancellables)
    }
    
    func fetchCarModels(for mark: CarMake) {
        NetworkService.shared.fetchCarModels(for: mark.make)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching car models: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] models in
                self?.carModels = models
            })
            .store(in: &cancellables)
    }
    
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
    
    func fetchServiceTypes() {
        NetworkService.shared.fetchServiceTypes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching service types: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] types in
                self?.serviceTypes = types
            })
            .store(in: &cancellables)
    }
}
