//
//  CarMake.swift
//  Drivex
//
//  Created by Alex Saroyan on 21.07.24.
//

import Foundation

struct CarMake: Codable, Identifiable, Hashable {
    let id = UUID()
    let make: String
    let yearFounded: Int
    let models: [CarModel]
    
    struct CarModel: Codable, Identifiable, Hashable {
        let id = UUID()
        let model: String
    }
}

struct CarMakesResponse: Codable {
    let carMakes: [CarMake]
}

struct CarData: Codable {
    let cars: [Car]
    let expenses: [Expense]
    
    struct Car: Codable {
        let services: [Service]
        
        struct Service: Codable {
            let type: String
        }
    }
    
    struct Expense: Codable {
        let type: String
    }
}

