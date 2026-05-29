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
                let name=networkClient.singleItem.name.replacingOccurrences(of: "-", with: " ")
                Text("Item name: \(networkClient.singleItem.name)")
                let effect: String=networkClient.singleItem.effect_entries.first?.short_effect ?? "None"
                Text("Item effect: \(effect)")
            }
        }
    }
}
