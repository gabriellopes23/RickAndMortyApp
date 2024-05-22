
import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Text("Rick and Morty")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        
        TitleView()
    }
}
