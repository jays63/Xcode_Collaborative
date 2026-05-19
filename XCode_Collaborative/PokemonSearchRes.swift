import SwiftUI

struct PokemonSearchRes :View {
    @Environment(NetworkClient.self) private var networkClient
    @State private var selectedMon: pokemon?
    @State private var selectedItem: item?
    @State private var selectedMove: move?
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            VStack{
                
            }
        }
    }
}
