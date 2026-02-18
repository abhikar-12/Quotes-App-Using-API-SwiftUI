//
//  API SwiftUI
//
//  Created by Abhishek Kusalkar on 17/02/26.
//

import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    
    @Published var quote: QuoteModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchQuote() async {
        guard let url = URL (string: "https://motivational-spark-api.vercel.app/api/quotes/random") else {
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
}
