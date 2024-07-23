//
//  ServiceViewModel.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//
import SwiftUI

class ServiceViewModel: ObservableObject {
    @Published var serviceTypes: [String] = []
    
    
    
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
        
    }
}
