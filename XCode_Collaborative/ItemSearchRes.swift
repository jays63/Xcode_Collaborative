import SwiftUI

struct ItemSearchRes :View {
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
                Text("Item name: \(networkClient.singleItem.name)")
                Text("Item effect: \(networkClient.singleItem.effect_entries)")
            }
        }
    }
}
