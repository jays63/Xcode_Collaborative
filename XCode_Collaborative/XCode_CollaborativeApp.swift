import SwiftUI

@main
struct XCode_CollaborativeApp: App {
    @State private var networkClient = NetworkClient()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(networkClient)
        }
    }
}
