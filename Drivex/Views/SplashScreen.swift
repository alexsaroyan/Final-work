//
//  splash.swift
//  Drivex
//
//  Created by Alex Saroyan on 13.07.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            CarSelectionView()
        } else {
            Image("Drivexa")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
