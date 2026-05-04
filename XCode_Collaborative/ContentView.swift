import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image(.pokeball)
            VStack(alignment: .center, spacing: 30){
                Text("Welcome to the pokedex! What do you want to find?")
                    .multilineTextAlignment(.center)
                Button("Browse dex"){}
                Button("Find the damage calculator"){}
                label: do {
                    Link("Here", destination: URL(string: "https://calc.pokemonshowdown.com/")!)
                }
                Button("Visit the unaffiliated battle simulator"){}
                label: do {
                    Link("Visit the unaffiliated battle simulator", destination: URL(string: "https://pokemonshowdown.com/")!)
                }
                Button("View items"){}
                Button("Get a meme, feature may be axed"){}
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
