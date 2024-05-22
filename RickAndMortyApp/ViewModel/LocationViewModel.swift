
import Foundation

class LocationViewModel: ObservableObject {
    @Published var locationModel: LocationModel = LocationModel.defaultLocationModel()
    @Published var residents: [Character] = []
    
    func getLocation() {
        let urlString = "https://rickandmortyapi.com/api/location"
        
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
                let newLocationModel = try jsonDecoder.decode(LocationModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.locationModel = newLocationModel
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
