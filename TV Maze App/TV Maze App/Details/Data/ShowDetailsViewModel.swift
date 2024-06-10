//
//  ShowDetailsViewModel.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import Foundation

internal struct ShowDetailsViewModel {
    let title: String
    let posterURL: String?
    let summary: String
    let rating: String
    let genres: [String?]?
    let playUrl: String?
}
