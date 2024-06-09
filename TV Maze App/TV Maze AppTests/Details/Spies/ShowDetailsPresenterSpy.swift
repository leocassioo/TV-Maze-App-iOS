//
//  ShowDetailsPresenterSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

final class ShowDetailsPresenterSpy: ShowDetailsPresenterInputProtocol {

    enum Method: Equatable {
        case viewDidLoad
    }
    
    private(set) var calledMethods: [Method] = []

    var view: ShowDetailsPresenterOutputProtocol?
    
    var interactor: ShowDetailsInteractorInputProtocol?
    
    func viewDidLoad() {
        calledMethods.append(.viewDidLoad)
    }
}
