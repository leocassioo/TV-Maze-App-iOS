//
//  HomePresenterSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class HomePresenterSpy: HomePresenterInputProtocol {
    
    enum Method: Equatable {
        case searchByQuery
        case navigateToDetailsById
    }
    
    private(set) var calledMethods: [Method] = []
    
    var view: HomePresenterOutputProtocol?
    
    var interactor: HomeInteractorInputProtocol?
    
    func searchByQuery(query: String?) {
        calledMethods.append(.searchByQuery)
    }
    
    func navigateToDetailsById(id: Int) {
        calledMethods.append(.navigateToDetailsById)
    }
    
}
