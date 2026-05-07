import SwiftUI

struct PokemonSearchRes :View {
    @Environment(NetworkClient.self) private var networkClient
    @State private var selectedMon: pokemon?
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            ScrollView(.vertical){
                
            }
        }
    }
}
