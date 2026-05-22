import SwiftUI

struct MoveSearchRes :View {
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
                Text("Name: \(networkClient.annoyance.name)")
                Text("Accuracy: \(networkClient.annoyance.accuracy)")
                Text("Effect chance: \(networkClient.annoyance.effect_chance)")
                Text("Damage type: \(networkClient.annoyance.damage_class)")
                Text("Base power: \(networkClient.annoyance.power)")
                Text("Uses: \(networkClient.annoyance.pp)")
                Text("Priority: \(networkClient.annoyance.priority)")
            }
        }
    }
}
