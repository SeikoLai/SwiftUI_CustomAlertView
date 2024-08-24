// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A customizable alert view for SwiftUI
public struct CustomAlertView<Content: View>: View {
    let title: String?
    let content: AlertContent
    let cancelAction: (() -> Void)?
    let doneAction: () -> Void
    
    /// Enum to represent different types of alert content
    public enum AlertContent {
        case text(String)
        case custom(Content)
    }
    
    /// Initializes a new custom alert view
    /// - Parameters:
    ///   - title: The title of the alert (optional)
    ///   - content: The content of the alert
    ///   - cancelAction: The action to perform when canceling (optional)
    ///   - doneAction: The action to perform when confirming
    public init(title: String? = nil,
                content: AlertContent,
                cancelAction: (() -> Void)? = nil,
                doneAction: @escaping () -> Void) {
        self.title = title
        self.content = content
        self.cancelAction = cancelAction
        self.doneAction = doneAction
    }
    
    public var body: some View {
        VStack(spacing: 30) {
            if let title = title {
                Text(title)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            
            Group {
                switch content {
                case .text(let string):
                    Text(string)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.vertical)
                case .custom(let view):
                    view
                }
            }
            
            HStack(spacing: 50) {
                Group {
                    if let cancelAction = cancelAction {
                        Button("Cancel", action: cancelAction)
                            .buttonStyle(.plain)
                    }
                    
                    Button("Done", action: doneAction)
                        .buttonStyle(.borderless)
                }
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
        .shadow(radius: 10)
    }
}

public extension CustomAlertView where Content == EmptyView {
    /// Initializes a new custom alert view with a text message
    /// - Parameters:
    ///   - title: The title of the alert (optional)
    ///   - message: The message to display in the alert
    ///   - cancelAction: The action to perform when canceling (optional)
    ///   - doneAction: The action to perform when confirming
    init(title: String? = nil,
         message: String,
         cancelAction: (() -> Void)? = nil,
         doneAction: @escaping () -> Void) {
        self.init(title: title,
                  content: .text(message),
                  cancelAction: cancelAction,
                  doneAction: doneAction)
    }
}

public extension CustomAlertView {
    /// Initializes a new custom alert view with custom content
    /// - Parameters:
    ///   - title: The title of the alert (optional)
    ///   - content: A closure returning the custom content view
    ///   - cancelAction: The action to perform when canceling (optional)
    ///   - doneAction: The action to perform when confirming
    init(title: String? = nil,
         @ViewBuilder content: () -> Content,
         cancelAction: (() -> Void)? = nil,
         doneAction: @escaping () -> Void) {
        self.init(title: title,
                  content: .custom(content()),
                  cancelAction: cancelAction,
                  doneAction: doneAction)
    }
}
