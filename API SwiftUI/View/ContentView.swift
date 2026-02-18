//
//  API SwiftUI
//
//  Created by Abhishek Kusalkar on 16/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = QuoteViewModel()
    
    var body: some View {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else if let post = viewModel.quote {
                    Text("QUOTE OF THE DAY")
                        .font(.title)
                        .bold()
                    Spacer()
                    Text(post.quote)
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(post.author)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {
                        Task {
                            await viewModel.fetchQuote()
                        }
                    } label: {
                        Text("New Quote")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight: 40)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    }
                    .shadow(color: .yellow, radius:1)
                }
            }
            .background(
                LinearGradient(
                    colors: [.white, .purple],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .task {
                await viewModel.fetchQuote()
            }
    }
}

#Preview {
    ContentView()
}
