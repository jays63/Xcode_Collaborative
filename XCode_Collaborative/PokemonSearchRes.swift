import SwiftUI

struct PokemonSearchRes :View {
    @Environment(NetworkClient.self) private var networkClient
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("Pokemon name: \(networkClient.mon.name)")
                Text("Type(s): \(networkClient.mon.types)")
                Text("Abilities: \(networkClient.mon.abilities)")
                Text("Stats: \(networkClient.mon.stats)")
            }
        }
    }
}
