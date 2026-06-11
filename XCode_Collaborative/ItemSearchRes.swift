import SwiftUI

struct ItemSearchRes :View {
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
                let name=networkClient.singleItem.name.replacingOccurrences(of: "-", with: " ")
                Text("Item name: \(name)")
                let filtered = networkClient.singleItem.effect_entries.filter { effect in
                    effect.language.name == languageChoice
                }.first?.short_effect ?? "No english version"
                let effect: String=networkClient.singleItem.effect_entries.first?.short_effect ?? "None"
                Text("Item effect: \(effect)")
            }
        }
    }
}
