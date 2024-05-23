
import SwiftUI

struct MenuView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    selectedTab = 0
                }, label: {
                    ImageMenuView(imageName: "person.circle.fill", title: "Character", isSelected: selectedTab == 0 )
                })
                
                Button(action: {
                    selectedTab = 1
                }, label: {
                    ImageMenuView(imageName: "globe", title: "Location", isSelected: selectedTab == 1)
                })
                
                Button(action: {
                    selectedTab = 2
                }, label: {
                    ImageMenuView(imageName: "tv.circle.fill", title: "Episode", isSelected: selectedTab == 2)
                })
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(
               RoundedRectangle(cornerRadius: 10)
                .fill(.green))
        }
    }
}

struct ImageMenuView: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
            Text(title)
                .font(.caption2)
        }
        .foregroundStyle(isSelected ? .white : .black.opacity(0.2))
        .shadow(radius: isSelected ? 5 : 0)
    }
}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        MenuView(selectedTab: .constant(0))
    }
//    ImageMenuView(imageName: "tv.circle.fill", title: "Episode")
}
