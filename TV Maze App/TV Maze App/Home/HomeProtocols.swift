//
//  HomeProtocols.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

// MARK: - Coordinator
internal protocol HomeCoordinatorProtocol: Any {
    func navigateToDetailsById(id: Int)
}

// MARK: - View -> Presenter
internal protocol HomePresenterInputProtocol: AnyObject {
    var view: HomePresenterOutputProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    func searchByQuery(query: String?)
    func navigateToDetailsById(id: Int)
}

// MARK: - Presenter -> View
internal protocol HomePresenterOutputProtocol: AnyObject {
    func showSearchResults(shows: [ShowResponse])
    func showError(error: Error)
}

// MARK: - Presenter -> Interactor
internal protocol HomeInteractorInputProtocol: AnyObject {
    
    var output: HomeInteractorOutputProtocol? { get set }
    
    func searchByQuery(query: String?)
}

// MARK: - Interactor -> Presenter
internal protocol HomeInteractorOutputProtocol: AnyObject {
    
    func searchByQueryWithSuccess(shows: [ShowResponse])
    func searchByQueryFailure(error: Error)
}
