
import Foundation

class LocationViewModel: ObservableObject {
    @Published var locationModel: LocationModel = LocationModel.defaultLocationModel()
    @Published var residents: [CharacterResult] = []
    
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
    
    func getResidents(residentUrl: [String]) {
        let group = DispatchGroup()
        var newResidents: [CharacterResult] = []
        for urlString in residentUrl {
            guard let url = URL(string: urlString) else { return }
            
            group.enter()
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let jsonDecoder = JSONDecoder()
                
                if let error = error {
                    print(error)
                    group.leave()
                    return
                }
                
                guard let data = data else {
                    print("data was nil")
                    group.leave()
                    return
                }
                
                do {
                    let resident = try jsonDecoder.decode(CharacterResult.self, from: data)
                    
                    DispatchQueue.main.async {
                        newResidents.append(resident)
                    }
                } catch {
                    print(error)
                }
                group.leave()
            }
            task.resume()
        }
        group.notify(queue: .main) {
            self.residents = newResidents
        }
    }
}
