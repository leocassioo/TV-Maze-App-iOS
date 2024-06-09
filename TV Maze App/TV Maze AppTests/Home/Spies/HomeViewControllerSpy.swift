//
//  HomeViewControllerSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class HomeViewControllerSpy: HomePresenterOutputProtocol {
    
    enum Method: Equatable {
        case showSearchResults
        case showError
    }
    
    private(set) var calledMethods: [Method] = []
    
    func showSearchResults(shows: [TV_Maze_App.ShowResponse]) {
        calledMethods.append(.showSearchResults)
    }
    
    func showError(error: any Error) {
        calledMethods.append(.showError)
    }
    
}
