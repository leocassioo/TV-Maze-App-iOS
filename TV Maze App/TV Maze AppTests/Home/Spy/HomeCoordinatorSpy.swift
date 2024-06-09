//
//  HomeCoordinatorSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class HomeCoordinatorSpy: HomeCoordinatorProtocol {
    
    enum Method: Equatable {
        case navigateToDetailsById
    }
    
    private(set) var calledMethods: [Method] = []
    
    func navigateToDetailsById(id: Int) {
        calledMethods.append(.navigateToDetailsById)
    }
    
}
