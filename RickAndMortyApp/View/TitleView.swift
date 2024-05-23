
import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Rick and Morty")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                NavigationLink(destination: {
                    EpisodeListView()
                }, label: {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .font(.title)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray.opacity(0.5)))
                })
                
                
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray.opacity(0.5))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                        Spacer()
                    }
                        .padding(.horizontal)
                        .foregroundStyle(.white))
                .frame(maxWidth: .infinity, maxHeight: 60)
                .padding()
            
        }
    }
}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        
        TitleView()
    }
}
