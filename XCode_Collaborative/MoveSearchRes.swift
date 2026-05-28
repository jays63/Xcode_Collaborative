import SwiftUI

struct MoveSearchRes :View {
    @Environment(NetworkClient.self) private var networkClient
    @State private var visible: Bool = true
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            if visible{
                VStack {
                    Text("Name: \(networkClient.annoyance.name)")
                    Text("Accuracy: \(networkClient.annoyance.accuracy)")
                    Text("Effect chance: \(networkClient.annoyance.effect_chance)")
                    Text("Damage type: \(networkClient.annoyance.damage_class.name)")
                    Text("Base power: \(networkClient.annoyance.power)")
                    Text("Uses: \(networkClient.annoyance.pp)")
                    Text("Priority: \(networkClient.annoyance.priority)")
                    Text("Effect: \(networkClient.annoyance.effect_entries.first?.short_effect)")
                }
                .onTapGesture {
                    withAnimation(.linear(duration: 0.2)){
                        visible.toggle()
                    }
                }
            }
        }
    }
}
