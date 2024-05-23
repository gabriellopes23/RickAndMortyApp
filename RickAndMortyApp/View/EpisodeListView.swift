
import SwiftUI

struct EpisodeListView: View {
    @StateObject var episodeVM: EpisodeViewModel = EpisodeViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(episodeVM.episodeModel.results.indices, id: \.self) { i in
                        let result = episodeVM.episodeModel.results[i]
                    
                    EpisodeItemView(name: result.name, episode: result.episode)
                        .frame(height: 80)
                }
            }
        }
        .onAppear {
            episodeVM.getEpisode()
        }
    }
}

struct EpisodeItemView: View {
    let name: String
    let episode: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(rowColorList)
            .frame(maxWidth: .infinity, maxHeight: 60)
            .overlay(
                HStack {
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.headline)
                        Text(episode)
                    }
                    .foregroundStyle(.white)
                    Spacer()
                }
                    .padding())
            .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        grayBackgroundColor.ignoresSafeArea()
        
//        EpisodeItemView(name: "Pilot", episode: "S01E01")
        EpisodeListView()
    }
}
