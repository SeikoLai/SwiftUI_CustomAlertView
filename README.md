# CustomAlertView

CustomAlertView is a flexible and customizable alert view for SwiftUI applications. It allows you to create alerts with custom content, titles, and actions.

## Features

- Customizable alert content
- Optional title
- Support for cancel and done actions
- Easy integration with SwiftUI views
- Animated presentation and dismissal

## Requirements

- iOS 13.0+
- macOS 10.15+
- tvOS 13.0+
- watchOS 6.0+
- Xcode 11.0+
- Swift 5.1+

## Installation

### Swift Package Manager

You can add CustomAlertView to your project using Swift Package Manager. In Xcode:

1. Go to File > Swift Packages > Add Package Dependency
2. Enter the repository URL: `https://github.com/yourusername/CustomAlertView.git`
3. Select the version you want to use

## Usage

There are two main ways to use CustomAlertView in your SwiftUI projects:

### 1. Using CustomAlertView directly

You can create and present a CustomAlertView directly in your SwiftUI views:

```swift
import SwiftUI
import CustomAlertView

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .customAlert(isPresented: $showAlert) {
            CustomAlertView(
                title: "Alert Title",
                message: "This is a custom alert message.",
                cancelAction: {
                    print("Alert canceled")
                },
                doneAction: {
                    print("Alert confirmed")
                }
            )
        }
    }
}
```

### 2. Using the customAlert modifier

You can use the `customAlert` modifier to present a custom alert on any view:

```swift
import SwiftUI
import CustomAlertView

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .customAlert(isPresented: $showAlert) {
            VStack {
                Text("Custom Content")
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
```

## Customization

CustomAlertView offers several customization options:

- Custom content: You can provide any SwiftUI view as the content of the alert.
- Title: An optional title for the alert.
- Actions: You can specify custom actions for the cancel and done buttons.
- Styling: The alert view uses system colors and can be further customized by modifying the view modifiers in the CustomAlertView struct.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions to CustomAlertView are welcome! Please feel free to submit a Pull Request.

