
import SwiftUI

struct MainView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    var body: some View {
        VStack {
            CharacterListView(characterVM: characterVM)
        }
        .padding()
    }
}

#Preview {
    MainView()
}
