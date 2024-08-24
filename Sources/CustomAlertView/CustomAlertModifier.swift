//
//  CustomAlertModifier.swift
//  CustomAlertView
//
//  Created by Sam on 2024/8/24.
//

import SwiftUI

/// A view modifier that presents a custom alert overlay
public struct CustomAlertModifier<AlertContent: View>: ViewModifier {
    /// Binding to control the visibility of the alert
    @Binding var isPresented: Bool
    /// The content of the alert
    let alertContent: AlertContent
    
    /// Applies the custom alert modifier to the content
    /// - Parameter content: The content to which the alert is applied
    /// - Returns: A view with the custom alert overlay
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if isPresented {
                // Semi-transparent background
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                
                // Alert content
                VStack {
                    alertContent
                }
                .transition(.scale)
                .zIndex(1)
            }
        }
        .animation(.easeInOut, value: isPresented)
    }
}

public extension View {
    /// Presents a custom alert on top of the current view
    /// - Parameters:
    ///   - isPresented: Binding to control the visibility of the alert
    ///   - content: A closure returning the content of the alert
    /// - Returns: A view with the custom alert modifier applied
    func customAlert<AlertContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> AlertContent
    ) -> some View {
        self.modifier(CustomAlertModifier(isPresented: isPresented, alertContent: content()))
    }
}
