import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to the pocket pokedex! What do you want to do")
                .multilineTextAlignment(.center)
            Button("Browse dex"){}
            Button("Visit the damage calculator"){}
            Button("Visit the unaffiliated battle simulator"){}
            Button("View items")
            Button("Get a meme, feature may be axed")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
