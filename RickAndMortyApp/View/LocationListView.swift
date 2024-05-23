
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
                        LocationDetailView(locationVM: locationVM, residentsUrl: result.residents)
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
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(rowColorList)
                .frame(width: 180, height: 75)
        )
    }
}

struct LocationDetailView: View {
    @ObservedObject var locationVM: LocationViewModel
    let columns = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
    ]
    
    let residentsUrl: [String]
    
    var body: some View {
        ZStack {
            grayBackgroundColor.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(locationVM.residents) { resident in
                        ImageUrl(imageUrl: resident.image, width: 150, height: 150)
                            .cornerRadius(20)
                    }
                }
            }
            .onAppear {
                locationVM.getResidents(residentUrl: residentsUrl)
        }
        }
    }
}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        
        LocationListView()
    }
}
