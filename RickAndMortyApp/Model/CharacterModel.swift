
import Foundation


// MARK: - CharacterModel
struct CharacterModel: Codable {
    let info: CharacterInfo
    let results: [CharacterResult]
    
    static func defaultCharacterModel() -> CharacterModel {
        return CharacterModel(
            info: CharacterInfo(
                count: 826,
                pages: 42,
                next: "https://rickandmortyapi.com/api/character/?page=2",
                prev: nil),
            results: [CharacterResult(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                origin: CharacterLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"),
                location: CharacterLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"),
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: ["https://rickandmortyapi.com/api/episode/1",
                          "https://rickandmortyapi.com/api/episode/2"],
                url: "https://rickandmortyapi.com/api/character/1",
                created: "2017-11-04T18:48:46.250Z")])
    }
}

// MARK: - Info
struct CharacterInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct CharacterResult: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct CharacterLocation: Codable {
    let name: String
    let url: String
}
