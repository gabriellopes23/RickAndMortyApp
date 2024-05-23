
import SwiftUI

struct MainView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    @StateObject var locationVm: LocationViewModel = LocationViewModel()
    @State var selectedTab = 0
    
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
            case 1:
                NavigationStack {
                    TabView {
                        ZStack {
                            grayBackgroundColor.ignoresSafeArea()
                            VStack(alignment: .leading) {
                                TitleView()
                                
                                LocationListView(locationVM: locationVm)
                            }
                        }
                    }
                }
            case 2:
                NavigationStack {
                    TabView {
                        ZStack {
                            grayBackgroundColor.ignoresSafeArea()
                            VStack(alignment: .leading) {
                                TitleView()
                                
                                EpisodeListView()
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
             MenuView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainView()
}
