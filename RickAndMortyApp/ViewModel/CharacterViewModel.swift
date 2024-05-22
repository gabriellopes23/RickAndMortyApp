
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characterModel: CharacterModel = CharacterModel.defaultCharacterModel()
    
    func getCharacter() {
        let urlString = "https://rickandmortyapi.com/api/character"
        
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
                let newCharacterModel = try jsonDecoder.decode(CharacterModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.characterModel = newCharacterModel
                }
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
}
