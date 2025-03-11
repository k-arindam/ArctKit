# ArctKit 🚀

**SwiftUI's Ultimate Companion for State Management, Routing, Dependency Injection, Storage, and Utilities!**

ArctKit is a lightweight yet powerful framework that combines high-performance **state management**, **intelligent dependency injection**, **route management**, **storage**, and **utility functions**—all in one seamless package. Inspired by GetX from Flutter, ArctKit enhances SwiftUI development by making it more scalable, maintainable, and efficient.

## ✨ Features

- 🚀 **High-Performance State Management** – Simplify state handling in your SwiftUI apps.
- 🔗 **Intelligent Dependency Injection** – Register and retrieve dependencies effortlessly.
- 🛤 **Route Management** – Navigate between views with ease.
- 📦 **Persistent Storage** – Save and retrieve data using a simple API.
- 🛠 **Powerful Utility Functions** – Commonly needed utilities like validation, file detection, and more.
- 🏎 **Blazing Fast & Lightweight** – No unnecessary boilerplate, just efficient code.

## 📦 Installation

### Swift Package Manager (SPM)

Add ArctKit to your **Package.swift**:

```swift
.package(url: "https://github.com/k-arindam/ArctKit.git", from: "0.0.2")
```

Or add it via **Xcode**:
1. Open your Xcode project.
2. Go to **File > Add Packages**.
3. Enter the URL: `https://github.com/k-arindam/ArctKit.git`.
4. Select the latest version and add it to your project.

## 📌 Getting Started

### 1️⃣ Define Your App Configuration

```swift
import ArctKit

struct MyApp: App {
    var body: some Scene {
        let config = ArctAppConfig(
            appGroup: "group.in.karindam.ArctKitDemo",
            initialBindings: [
                Constants.dataControllerKey: DataController()
            ],
            initialRoute: AppRoutes.home,
            routeBuilder: AppRoutes.builder
        )

        WindowGroup {
            ArctApp(config: config)
        }
    }
}
```

### 2️⃣ Dependency Injection Made Easy 🧩

```swift
// Register a dependency
let authControllerKey: String = "in.karindam.ArctKitDemo.auth"

do {
    _ = try Arct.put(AuthController(), with: authControllerKey)
} catch {
    print("Failed to register dependency: \(error)")
}

// Retrieve a dependency
let auth: AuthController? = try? Arct.find(with: authControllerKey)
```

### 3️⃣ Navigate Between Views Seamlessly 🛤

```swift
enum AppRoutes: ArctRoute {
    case home
    case settings
    
    @ViewBuilder
    static func builder(_ route: Self) -> some View {
        switch route {
        case .home:
            HomeView()
        case .settings:
            SettingsView()
        }
    }
}

try? Arct.push(AppRoutes.settings)
```

### 4️⃣ Persistent Storage with UserDefaults 📦

```swift
// Save data
try Arct.write("John Doe", for: "username")

// Read data
let username: String? = try? Arct.read(String.self, for: "username")
```

## 📚 Documentation

For full documentation, visit [here](http://arctkit.karindam.in).

## 🛠 Utility Functions

```swift
let isValidEmail = Arct.isEmail("test@example.com")  // true
let isIPv4 = Arct.isIPv4("192.168.1.1")  // true
let isIPv4 = Arct.isIPv6("192.168.1.1")  // false
```

## 🤝 Contributing

We welcome contributions! Feel free to submit issues or pull requests.

## 📜 License

ArctKit is available under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

🚀 **Supercharge your SwiftUI development with ArctKit today!**

---
