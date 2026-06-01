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
                    let name=networkClient.annoyance.name.replacingOccurrences(of: "-", with: " ")
                    Text("Name: \(name)")
                    let accuracy=networkClient.annoyance.accuracy ?? 0
                    if (accuracy != 0){
                        Text("Accuracy: \(accuracy)")
                    } else {
                        Text("Accuracy: --")
                    }
                    let odds: Int=networkClient.annoyance.effect_chance ?? 0
                    Text("Effect chance: \(odds)")
                    Text("Damage type: \(networkClient.annoyance.damage_class.name)")
                    let power: Int=networkClient.annoyance.power ?? 0
                    Text("Base power: \(power)")
                    Text("Uses: \(networkClient.annoyance.pp)")
                    Text("Priority: \(networkClient.annoyance.priority)")
                    let filtered = networkClient.annoyance.effect_entries.filter { effect in
                        effect.language.name == "en"
                    }.first?.short_effect ?? "No english version"
                    Text("Effect: \(filtered)")
                    
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
