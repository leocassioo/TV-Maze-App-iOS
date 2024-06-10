//
//  CastModel.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 10/06/24.
//

import Foundation

internal struct CastModel: Decodable {
    let person: Person?
    let character: Character?
}

internal struct Person: Decodable {
    let id: Int
    let name: String?
    let image: Image?
}

internal struct Character: Decodable {
    let id: Int
    let name: String?
    let image: Image?
}
