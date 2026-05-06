import SwiftUI

enum searchCase{
    case pokemon, item, move, ability
}

struct ContentView: View {
    @Environment(NetworkClient.self) private var networkClient;
    @State private var pokemonSearch: Bool = false;
    @State private var itemSearch: Bool = false;
    @State private var moveSearch: Bool = false;
    @State private var abilitySearch: Bool = false;
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
                        Button("View items"){
                            itemSearch=true
                        }
                        .navigationDestination(isPresented: $itemSearch){
                            
                        }
                        Button("Browse moves"){
                            moveSearch=true
                        }
                        .navigationDestination(isPresented: $moveSearch){
                            
                        }
                        Button("Browse abilities"){
                            abilitySearch=true
                        }
                        .navigationDestination(isPresented: $abilitySearch){
                            
                        }
                    }
                    Button("Find the damage calculator"){}
                    label: do {
                        Link("Here", destination: URL(string: "https://calc.pokemonshowdown.com/")!)
                    }
                    Button("Visit the unaffiliated battle simulator"){}
                    label: do {
                        Link("Visit the battle simulator (This app is not affiliated with the above)", destination: URL(string: "https://pokemonshowdown.com/")!)
                    }
                    
                }
                .padding()
        }
    }
}

func search(in: searchCase) async{
    Task{
        
    }
}

#Preview {
    ContentView()
}
