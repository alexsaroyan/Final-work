//
//  ViewModifier.swift
//  Drivex
//
//  Created by Alex Saroyan on 22.07.24.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    @AppStorage("appAppearance") var appAppearance: AppAppearance = .light

    func body(content: Content) -> some View {
        content
            .background(appAppearance == .light ? Color.white : Color.black)
            .environment(\.colorScheme, appAppearance == .light ? .light : .dark)
    }
}

extension View {
    func applyAppearance() -> some View {
        self.modifier(BackgroundModifier())
    }
}

