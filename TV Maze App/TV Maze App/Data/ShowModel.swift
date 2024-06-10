//
//  ShowModel.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal struct ShowResponse: Decodable {
    let score: Double?
    let show: Show?
}

internal struct Show: Decodable {
    let id: Int?
    let url: String?
    let name: String?
    let genres: [String?]?
    let status: ShowStatus?
    let officialSite: String?
    let rating: Rating?
    let image: Image?
    let summary: String?

}

internal struct Rating: Decodable {
    let average: Double?
}

internal struct Country: Decodable {
    let name: String?
    let code: String?
    let timezone: String?
}

internal struct Image: Decodable {
    let medium: String?
    let original: String?
}

enum ShowStatus: String, Decodable {
    case running = "Running"
    case ended = "Ended"
    case toBeDetermined = "To Be Determined"
    case inDevelopment = "In Development"
    
    var displayColor: UIColor {
        switch self {
        case .running:
            return .green
        case .ended:
            return .red
        case .toBeDetermined:
            return .orange
        case .inDevelopment:
            return .blue
        }
    }
    
    var displayFont: UIFont {
        switch self {
        case .ended:
            return UIFont.boldSystemFont(ofSize: 14)
        default:
            return UIFont.systemFont(ofSize: 14)
        }
    }
}

internal struct AliaseModel: Decodable {
    
    let name: String
    let country: Country?
    
}
