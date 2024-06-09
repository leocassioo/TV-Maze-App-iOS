//
//  HomeInteractorSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class HomeInteractorSpy: HomeInteractorInputProtocol {
    
    enum Method: Equatable {
        case searchByQuery(query: String?)
    }
    
    private(set) var calledMethods: [Method] = []
    
    var output: HomeInteractorOutputProtocol?
    
    func searchByQuery(query: String?) {
        calledMethods.append(.searchByQuery(query: query))
    }
    
}
