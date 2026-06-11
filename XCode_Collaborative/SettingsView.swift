import SwiftUI

struct SettingsView: View {
    @Binding var languageChoice:String
    var body: some View {
        Menu {
              Button("en", action: { languageChoice = "Option 1" })
              Button("fr", action: { languageChoice = "Option 2" })
              Button("de", action: { languageChoice = "Option 3" })
            } label: {
              Label(languageChoice, systemImage: "chevron.down")
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            }
        Text("Translations are not guaranteed to work")
    }
}
