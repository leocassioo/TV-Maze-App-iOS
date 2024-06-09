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
                      type: String? = "type",
                      language: String? = "language",
                      genres: [String?]? = ["genre1", "genre2"],
                      status: ShowStatus? = .running,
                      runtime: Int? = 60,
                      averageRuntime: Int? = 60,
                      premiered: String? = "2022-01-01",
                      ended: String? = "2022-12-31",
                      officialSite: String? = "officialSite",
                      schedule: Schedule? = .dummy(),
                      rating: Rating? = .dummy(),
                      weight: Int? = 10,
                      network: Network? = .dummy(),
                      image: Image? = .dummy(),
                      summary: String? = "summary",
                      links: Links? = .dummy()) -> Show {
        .init(id: id,
              url: url,
              name: name,
              type: type,
              language: language,
              genres: genres,
              status: status,
              runtime: runtime,
              averageRuntime: averageRuntime,
              premiered: premiered,
              ended: ended,
              officialSite: officialSite,
              schedule: schedule,
              rating: rating,
              weight: weight,
              network: network,
              image: image,
              summary: summary,
              links: links)
    }
}

extension Schedule {
    static func dummy(time: String? = "20:00", days: [String]? = ["Monday", "Wednesday"]) -> Schedule {
        .init(time: time, days: days)
    }
}

extension Rating {
    static func dummy(average: Double? = 8.5) -> Rating {
        .init(average: average)
    }
}

extension Network {
    static func dummy(id: Int? = 1,
                      name: String? = "Network Name",
                      country: Country? = .dummy(),
                      officialSite: String? = "officialSite") -> Network {
        .init(id: id, name: name, country: country, officialSite: officialSite)
    }
}

extension Country {
    static func dummy(name: String? = "Country Name", code: String? = "CN", timezone: String? = "Timezone") -> Country {
        .init(name: name, code: code, timezone: timezone)
    }
}

extension Externals {
    static func dummy(tvrage: Int? = 1, thetvdb: Int? = 2, imdb: String? = "imdbID") -> Externals {
        .init(tvrage: tvrage, thetvdb: thetvdb, imdb: imdb)
    }
}

extension Image {
    static func dummy(medium: String? = "mediumImage", original: String? = "originalImage") -> Image {
        .init(medium: medium, original: original)
    }
}

extension Links {
    static func dummy(selfLink: Link? = .dummy(href: "selfLink"), previousEpisode: Link? = .dummy(href: "previousEpisode")) -> Links {
        .init(selfLink: selfLink, previousEpisode: previousEpisode)
    }
}

extension Link {
    static func dummy(href: String? = "href", name: String? = "name") -> Link {
        .init(href: href, name: name)
    }
}

extension AliaseModel {
    static func dummy(name: String = "name", country: Country = Country.dummy()) -> AliaseModel {
        .init(name: name, country: country)
    }
}

