//
//  ShowDetailsInteractorSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class ShowDetailsInteractorSpy: ShowDetailsInteractorInputProtocol {
    
    enum Method: Equatable {
        case fetchShowDetails
        case fetchAliases
        case fetchCast
    }
    
    private(set) var calledMethods: [Method] = []

    var output: ShowDetailsInteractorOutputProtocol?
    
    func fetchShowDetails() {
        calledMethods.append(.fetchShowDetails)
    }
    
    func fetchAliases() {
        calledMethods.append(.fetchAliases)
    }
    
    func fetchCast() {
        calledMethods.append(.fetchCast)
    }
    
}
