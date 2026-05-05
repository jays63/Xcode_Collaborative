import SwiftUI

struct ContentView: View {
    @Environment(NetworkClient.self) private var networkClient;
    @State private var pokemonSearch: Bool = false;
    @State private var itemSearch: Bool = false
    var body: some View {
        ZStack{
            Image(.pokeball)
                VStack(alignment: .center, spacing: 30){
                    Text("Welcome to the pokedex! What do you want to find?")
                        .multilineTextAlignment(.center)
                    NavigationStack{
                        Button("Browse dex"){
                            pokemonSearch = true
                        }
                        .navigationDestination(isPresented: $pokemonSearch){
                            
                        }
                    }
                    Button("Find the damage calculator"){}
                    label: do {
                        Link("Here", destination: URL(string: "https://calc.pokemonshowdown.com/")!)
                    }
                    Button("Visit the unaffiliated battle simulator"){}
                    label: do {
                        Link("Visit the unaffiliated battle simulator", destination: URL(string: "https://pokemonshowdown.com/")!)
                    }
                    Button("View items"){}
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
