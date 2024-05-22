import Foundation


// MARK: - EpisodeModel
struct EpisodeModel: Codable {
    let info: EpisodeInfo
    let results: [EpisodeResult]
    
    static func defaultEpisodeModel() -> EpisodeModel {
        return EpisodeModel(
            info: EpisodeInfo(
                count: 51,
                pages: 3,
                next: "https://rickandmortyapi.com/api/episode?page=2",
                prev: nil),
            results: [EpisodeResult(
                id: 1,
                name: "Pilot",
                airDate: "December 2, 2013",
                episode: "S01E01",
                characters: ["https://rickandmortyapi.com/api/character/1",
                             "https://rickandmortyapi.com/api/character/2"],
                url: "https://rickandmortyapi.com/api/episode/1",
                created: "2017-11-10T12:56:33.798Z")])
    }
}

// MARK: - Info
struct EpisodeInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct EpisodeResult: Codable {
    let id: Int
        let name, airDate, episode: String
        let characters: [String]
        let url: String
        let created: String

        enum CodingKeys: String, CodingKey {
            case id, name
            case airDate = "air_date"
            case episode, characters, url, created
        }
}
