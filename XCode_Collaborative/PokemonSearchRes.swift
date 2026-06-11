import SwiftUI

struct PokemonSearchRes :View {
    private var languageChoice: String
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
                ForEach(networkClient.mon.types, id: \.type) { mon in
                    Text("Type: \(mon.type.name)")
                }
                ForEach(networkClient.mon.abilities, id: \.ability) { mon in
                    Text("Ability: \(mon.ability.name)")
                }
                ForEach(networkClient.mon.stats, id: \.base_stat) { thing in
                    Text("\(thing.stat.name): \(thing.base_stat)")
                }
            }
        }
    }
}
