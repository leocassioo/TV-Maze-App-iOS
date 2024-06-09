//
//  ShowDetailsInteractorOutputSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class ShowDetailsInteractorOutputSpy: ShowDetailsInteractorOutputProtocol {
    
    enum Method: Equatable {
        case didFetchShowDetails
        case didFailToFetchShowDetails
        case didFetchAliases
        case didFailToFetchAliases
    }
    
    private(set) var calledMethods: [Method] = []
    
    func didFetchShowDetails(showDetails: Show) {
        calledMethods.append(.didFetchShowDetails)
    }
    
    func didFailToFetchShowDetails(with error: Error) {
        calledMethods.append(.didFailToFetchShowDetails)
    }
    
    func didFetchAliases(aliases: [AliaseModel]) {
        calledMethods.append(.didFetchAliases)
    }
    
    func didFailToFetchAliases(with error: Error) {
        calledMethods.append(.didFailToFetchAliases)
    }
}

