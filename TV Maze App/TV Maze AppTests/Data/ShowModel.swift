//
//  ShowModel.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

extension ShowResponse {
    static func dummy(score: Double? = 1, show: Show? = .dummy()) -> ShowResponse {
        .init(score: score, show: show)
    }
}

extension Show {
    static func dummy(id: Int? = 1,
                      url: String? = "url",
                      name: String? = "name",
                      genres: [String?]? = ["genre1", "genre2"],
                      status: ShowStatus? = .running,
                      officialSite: String? = "officialSite",
                      rating: Rating? = .dummy(),
                      image: Image? = .dummy(),
                      summary: String? = "summary") -> Show {
        .init(id: id,
              url: url,
              name: name,
              genres: genres,
              status: status,
              officialSite: officialSite,
              rating: rating,
              image: image,
              summary: summary)
    }
}

extension Rating {
    static func dummy(average: Double? = 8.5) -> Rating {
        .init(average: average)
    }
}

extension Country {
    static func dummy(name: String? = "Country Name", code: String? = "CN", timezone: String? = "Timezone") -> Country {
        .init(name: name, code: code, timezone: timezone)
    }
}

extension Image {
    static func dummy(medium: String? = "mediumImage", original: String? = "originalImage") -> Image {
        .init(medium: medium, original: original)
    }
}

extension AliaseModel {
    static func dummy(name: String = "name", country: Country = Country.dummy()) -> AliaseModel {
        .init(name: name, country: country)
    }
}

extension ShowStatus {
    static var dummy: ShowStatus {
        return .running
    }
}

extension ShowStatus {
    static func dummy(status: ShowStatus = .running) -> ShowStatus {
        return status
    }
}
