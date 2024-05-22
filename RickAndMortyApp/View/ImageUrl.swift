
import SwiftUI

struct ImageUrl: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    var imageUrl: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
           if let url = URL(string: imageUrl) {
             AsyncImage(url: url) { phase in
                 switch phase {
                 case .empty:
                     ProgressView()
                 case .success(let image):
                     image
                         .resizable()
                         .frame(width: width, height: height)
                 case .failure:
                     Image(systemName: "photo")
                         .resizable()
                         .frame(width: width, height: height)
                 default:
                     EmptyView()
                 }
             }
         }
    }
}

#Preview {
    ImageUrl(imageUrl: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", width: 160, height: 200)
}
