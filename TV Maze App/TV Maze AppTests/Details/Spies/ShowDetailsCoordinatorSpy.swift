//
//  ShowDetailsCoordinatorSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class ShowDetailsCoordinatorSpy: ShowDetailsCoordinatorProtocol {
    
    enum Method: Equatable {
    }
    
    private(set) var calledMethods: [Method] = []
    
    var showId: Int = 0
    
}
