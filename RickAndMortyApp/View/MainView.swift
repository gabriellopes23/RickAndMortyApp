
import SwiftUI

struct MainView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    @StateObject var locationVm: LocationViewModel = LocationViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case 0:
                NavigationStack {
                    TabView {
                        ZStack {
                            grayBackgroundColor.ignoresSafeArea()
                            VStack(alignment: .leading) {
                                TitleView()
                                
                                CharacterListView(characterVM: characterVM)
                            }
                        }
                    }
                }
            default:
                NavigationStack {
                    TabView {
                        ZStack {
                            grayBackgroundColor.ignoresSafeArea()
                            VStack(alignment: .leading) {
                                TitleView()
                                
                                CharacterListView(characterVM: characterVM)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
