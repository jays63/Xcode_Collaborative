import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Hoodies Indoors")
            Text("We still need to choose an API")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
