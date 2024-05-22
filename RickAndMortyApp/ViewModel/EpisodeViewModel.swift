
import Foundation

class EpisodeViewModel: ObservableObject {
    @Published var episodeModel: EpisodeModel = EpisodeModel.defaultEpisodeModel()
    
    func getEpisode() {
        let urlString = "https://rickandmortyapi.com/api/episode"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                let newEpisodeModel = try jsonDecoder.decode(EpisodeModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.episodeModel = newEpisodeModel
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
