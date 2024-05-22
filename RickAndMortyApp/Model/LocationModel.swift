import Foundation

// MARK: - LocationModel
struct LocationModel: Codable {
    let info: LocationInfo
    let results: [LocationResult]
    
    static func defaultLocationModel() -> LocationModel {
        return LocationModel(
            info: LocationInfo(
                count: 126,
                pages: 7,
                next: "https://rickandmortyapi.com/api/location?page=2",
                prev: nil),
            results: [LocationResult(
                id: 1,
                name: "Earth",
                type: "Planet",
                dimension: "Dimension C-137",
                residents: ["https://rickandmortyapi.com/api/character/1",
                            "https://rickandmortyapi.com/api/character/2"],
                url: "https://rickandmortyapi.com/api/location/1",
                created: "2017-11-10T12:42:04.162Z")])
    }
}

// MARK: - Info
struct LocationInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct LocationResult: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
