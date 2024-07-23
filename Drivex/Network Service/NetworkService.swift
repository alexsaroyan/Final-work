//
//  NetworkService.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import Foundation
import Combine

class NetworkService {
    static let shared = NetworkService()
    
    func fetchCarMakes() -> AnyPublisher<[CarMake], Error> {
        guard let url = URL(string: "https://mocki.io/v1/38931cf0-7af4-4eea-b389-db59919e06a3") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CarMakesResponse.self, decoder: JSONDecoder())
            .map { $0.carMakes }
            .eraseToAnyPublisher()
    }
    
    func fetchCarModels(for make: String) -> AnyPublisher<[String], Error> {
        fetchCarMakes()
            .map { carMakes in
                carMakes.first { $0.make == make }?.models.map { $0.model } ?? []
            }
            .eraseToAnyPublisher()
    }
    
    func fetchServiceTypes() -> AnyPublisher<[String], Error> {
        guard let url = URL(string: "https://mocki.io/v1/0c584d6f-2a04-4875-8697-ac67bf0ecc45") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CarData.self, decoder: JSONDecoder())
            .map { $0.cars.first?.services.map { $0.type } ?? [] }
            .eraseToAnyPublisher()
    }
    
    func fetchExpenseTypes() -> AnyPublisher<[String], Error> {
        guard let url = URL(string: "https://mocki.io/v1/0c584d6f-2a04-4875-8697-ac67bf0ecc45") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CarData.self, decoder: JSONDecoder())
            .map { $0.expenses.map { $0.type } }
            .eraseToAnyPublisher()
    }
}
