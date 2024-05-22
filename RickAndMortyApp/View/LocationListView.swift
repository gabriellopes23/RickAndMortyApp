
import SwiftUI

struct LocationListView: View {
    @StateObject var locationVM: LocationViewModel = LocationViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(locationVM.locationModel.results.indices, id: \.self) { i in
                    let result = locationVM.locationModel.results[i]
                    
                    NavigationLink(destination: {
                        
                    }, label: {
                        LocationItemView(name: result.name, type: result.type)
                    })
                }
            }
        }
        .frame(width: widthSize, alignment: .center)
        .onAppear {
            locationVM.getLocation()
        }
    }
}

struct LocationItemView: View {
    let name: String
    let type: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
                .foregroundStyle(.white)
                .lineLimit(1)
            Text(type)
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(rowColorList)
                .frame(width: 180, height: 75)
        )
    }
}

//struct LocationDetailView: View {
//    @StateObject var locationVM: LocationViewModel = LocationViewModel()
//    let columns = [
//        GridItem(.adaptive(minimum: 200)),
//        GridItem(.adaptive(minimum: 200)),
//    ]
//    
//    let imageUrl: String
//    
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            LazyVGrid(columns: columns, spacing: 15) {
//                ForEach(locationVM.locationModel.results[0].residents.indices, id: \.self) { i in
//                    let residentes = locationVM.locationModel.results[0].residents[i]
//                    
//                    ImageUrl(imageUrl: residentes, width: 50, height: 50)
//                }
//            }
//        }
//    }
//}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        LocationListView()
//                LocationItemView(name: "Earth (C-137)", type: "Planet")
//        LocationDetailView(imageUrl: "https://rickandmortyapi.com/api/character/38")
    }
}
