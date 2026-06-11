import SwiftUI


struct ContentView: View {
    @Environment(NetworkClient.self) private var networkClient;
    @State private var pokemonSearch: Bool = false;
    @State private var itemSearch: Bool = false;
    @State private var moveSearch: Bool = false;
    @State private var text: String = ""
    @AppStorage("language") private var languageChoice: String="en"
    var body: some View {
        ZStack{
            Image(.splashimg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                VStack(alignment: .center, spacing: 30){
                    NavigationLink(destination: SettingsView(languageChoice: $languageChoice)){
                        Image(.pokeball)
                    }
                    if (languageChoice=="en"){
                        Text("Welcome to the pokédex! What do you want to find?")
                            .multilineTextAlignment(.center)
                    } else if (languageChoice=="de"){
                        Text("Wilkommen bei der pokédex! Was brauchen Sie zu finden?")
                    } else if (languageChoice=="fr"){
                        Text("Non, je déteste les Français.")
                            .multilineTextAlignment(.center)
                    }
                    NavigationStack{
                        Button("Browse dex"){
                            pokemonSearch = true
                        }
                        .navigationDestination(isPresented: $pokemonSearch){
                            VStack  {
                                PokemonSearchRes(languageChoice: languageChoice)
                            }
                            .searchable(text: $text)
                            .onSubmit (of: .search){
                                search(entered: .mon, target: text)
                            }
                        }
                        Button("View items"){
                            itemSearch=true
                        }
                        .navigationDestination(isPresented: $itemSearch){
                            VStack{
                                ItemSearchRes(languageChoice: $languageChoice)
                            }
                            .searchable(text: $text)
                            .onSubmit (of: .search){
                                search(entered: .item, target: text)
                            }
                        }
                        Button("Browse moves"){
                            moveSearch=true
                        }
                        .navigationDestination(isPresented: $moveSearch){
                            VStack{
                                MoveSearchRes(languageChoice: languageChoice)
                            }
                            .searchable(text: $text)
                            .onSubmit (of: .search){
                                search(entered: .move, target: text)
                            }
                        }
                    }
                    Link("A damage calculator, in your very own pocket!", destination: URL(string: "https://calc.pokemonshowdown.com/")!)
                        .buttonStyle(.glassProminent)
                    Link("Visit the battle simulator (Not affiliated)", destination: URL(string: "https://pokemonshowdown.com/")!)
                        .buttonStyle(.glassProminent)
                    
                }
                .padding()
        }
    }
    
    func search(entered: searcher, target: String) {
        Task{
            let thing=target.replacingOccurrences(of: " ", with: "-")
            await networkClient.search(input: thing, queryType: entered)
        }
    }
}

#Preview {
    ContentView()
}
