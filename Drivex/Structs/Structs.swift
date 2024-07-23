//
//  StructsALL.swift
//  Drivex
//
//  Created by Alex Saroyan on 17.07.24.
//
import SwiftUI
import Foundation

struct ServiceExpenseData: Codable {
    let services: [Service]
    let expenses: [Expense]
}

struct Service: Codable {
    let type: String
    let recommended_interval: String
    let estimated_cost: String
    let last_serviced_odometer: Int
}

struct Expense: Codable {
    let type: String
    let recommended_interval: String
    let estimated_cost: String
    let last_serviced_odometer: Int
}
