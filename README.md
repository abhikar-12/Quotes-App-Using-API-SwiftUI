**📜 Quotes App Using API SwiftUI**

A simple Quotes App built using SwiftUI and MVVM architecture.
The app fetches quotes from a public API and displays them with proper loading and error handling.

<img width="378" height="614" alt="README" src="https://github.com/user-attachments/assets/40ad67cf-84d0-453e-b024-da15740ee45a" />



**🚀 Features**
      
    📡 Fetch quotes from API
    🔄 Async/Await networking
    🏗 MVVM Architecture
    ⏳ Loading indicator
    ❌ Error handling
    🎯 Clean and minimal UI


**🛠 Tech Stack**

    Swift
    SwiftUI
    MVVM
    URLSession
    Async/Await
    JSON Decoding

**🏗 Architecture**

    This project follows MVVM (Model-View-ViewModel) pattern:

**Model**

    Handles API response structure
    Uses Codable

**ViewModel**

    Handles API call logic
    Manages loading & error states
    Uses @Published properties
    Marked with @MainActor

**View**

    Observes ViewModel using @StateObject
    Displays UI
    Shows loading & error states

**📂 Project Structure**

    Quotes-App-Using-API-SwiftUI
    │
    ├── Model
    │   └── QuoteModel.swift
    │
    ├── ViewModel
    │   └── QuoteViewModel.swift
    │
    ├── View
    │   └── ContentView.swift
    │
    └── QuotesApp.swift

**📡 API Implementation Flow**

    Check API response
    Create Codable model
    Create ViewModel
    Write async fetch function
    Decode JSON using JSONDecoder
    Handle loading & error
    Connect to SwiftUI View using .task

**🔄 API Fetch Example**

    func fetchQuote() async {
    guard let url = URL(string: "YOUR_API_URL") else {
        errorMessage = "Invalid URL"
        return
    }

    isLoading = true
    errorMessage = nil

    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        quote = try JSONDecoder().decode(QuoteModel.self, from: data)
    } catch {
        errorMessage = error.localizedDescription
    }

    isLoading = false
}

