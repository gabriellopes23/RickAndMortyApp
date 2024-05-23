
import SwiftUI

struct CharacterListView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 400))
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(characterVM.characterModel.results.indices, id: \.self) { i in
                    let result = characterVM.characterModel.results[i]
                    
                    NavigationLink(destination: {
                        CharacterItemView(characterVM: characterVM, name: result.name, imageUrl: result.image, status: result.status, species: result.species, gender: result.gender, origin: result.origin.name, location: result.location.name)
                    }, label: {
                        CharacterRowView(characterVM: characterVM, imageUrl: result.image, name: result.name, status: result.status, species: result.species, gender: result.gender)
                    })
                }
                .padding(.horizontal, 10)
            }
        }
        .frame(width: widthSize, alignment: .center)
        .onAppear {
            characterVM.getCharacter()
        }
    }
}

struct CharacterRowView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    
    let imageUrl: String
    let name: String
    let status: String
    let species: String
    let gender: String
    
    var body: some View {
        HStack {
            ImageUrl(imageUrl: imageUrl, width: 150, height: 170)
                .mask(LeftCornerRadiusShape(radius: 25))
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.title2)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "circle.fill")
                        .font(.caption)
                        .foregroundStyle(characterVM.characterModel.results[0].status == "Alive" ? Color.green : Color.red)
                    Text("\(status) - \(species)")
                        .font(.headline)
                        .fontWeight(.light)
                }
                Text(gender)
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
            }
            .foregroundStyle(.white)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(rowColorList))
    }
}

struct CharacterItemView: View {
    @StateObject var characterVM: CharacterViewModel = CharacterViewModel()
    let name: String
    let imageUrl: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let location: String
    
    var body: some View {
        ZStack {
            grayBackgroundColor.ignoresSafeArea()
            
            VStack(spacing: 10) {
                Text(name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ImageUrl(imageUrl: imageUrl, width: 300, height: 300)
                    .cornerRadius(20)
                
                Text("Status: \(status)")
                Text("Species: \(species)")
                Text("Gender: \(gender)")
                Text("Origin: \(origin)")
                Text("Location: \(location)")
            }
            .font(.headline)
            .foregroundStyle(.white)
        }
    }
}
#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        
        CharacterListView()
    }
    
}
