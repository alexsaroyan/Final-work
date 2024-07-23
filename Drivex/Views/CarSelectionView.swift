//
//  CarSelectionView.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI

struct CarSelectionView: View {
    @StateObject private var viewModel = CarViewModel()
    @State private var showingModels = false
    @State private var showingDashboard = false

    var body: some View {
        NavigationView {
            VStack {
                if showingModels {
                    Picker("Select Model", selection: $viewModel.selectedModel) {
                        ForEach(viewModel.carModels, id: \.self) { model in
                            Text(model).tag(model as String?)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()

                    Button(action: {
                        if viewModel.selectedModel != nil {
                            showingDashboard = true
                        }
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    NavigationLink(destination: DashboardView(), isActive: $showingDashboard) {
                        EmptyView()
                    }

                } else {
                    Picker(selection: $viewModel.selectedMark, label: Text(viewModel.selectedMark?.make ?? "Select Make")) {
                        ForEach(viewModel.carMarks, id: \.self) { make in
                            Text(make.make).tag(make as CarMake?)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding()

                    Button(action: {
                        if viewModel.selectedMark != nil {
                            showingModels = true
                        }
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Select Car")
            .onAppear {
                viewModel.fetchCarMarks()
            }
            .onChange(of: viewModel.selectedMark) { newValue in
                if let mark = newValue {
                    viewModel.fetchCarModels(for: mark)
                }
            }
        }
    }
}

struct CarSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarSelectionView()
    }
}
