import SwiftUI

struct SettingsView: View {
    @Binding var languageChoice:String
    var body: some View {
        Menu {
              Button("en", action: { languageChoice = "en" })
              Button("fr", action: { languageChoice = "fr" })
              Button("de", action: { languageChoice = "de" })
            } label: {
              Label(languageChoice, systemImage: "chevron.down")
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            }
        Text("Translations are not guaranteed to work")
    }
}
