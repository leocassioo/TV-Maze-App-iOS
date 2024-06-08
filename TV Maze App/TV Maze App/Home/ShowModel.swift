//
//  ShowModel.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

internal struct ShowResponse: Decodable {
    let score: Double?
    let show: Show?
}

internal struct Show: Decodable {
    let id: Int?
    let url: String?
    let name: String?
    let type: String?
    let language: String?
    let genres: [String?]?
    let status: String?
    let runtime: Int?
    let averageRuntime: Int?
    let premiered: String?
    let ended: String?
    let officialSite: String?
    let schedule: Schedule?
    let rating: Rating?
    let weight: Int?
    let network: Network?
    let image: Image?
    let summary: String?
    let links: Links?
}

internal struct Schedule: Decodable {
    let time: String?
    let days: [String]?
}

internal struct Rating: Decodable {
    let average: Double?
}

internal struct Network: Decodable {
    let id: Int?
    let name: String?
    let country: Country?
    let officialSite: String?
}

internal struct Country: Decodable {
    let name: String?
    let code: String?
    let timezone: String?
}

internal struct Externals: Decodable {
    let tvrage: Int?
    let thetvdb: Int?
    let imdb: String?
}

internal struct Image: Decodable {
    let medium: String?
    let original: String?
}

internal struct Links: Decodable {
    let selfLink: Link?
    let previousEpisode: Link?
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case previousEpisode = "previousepisode"
    }
}

internal struct Link: Decodable {
    let href: String?
    let name: String?
}
