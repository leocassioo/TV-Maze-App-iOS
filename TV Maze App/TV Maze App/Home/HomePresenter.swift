//
//  HomePresenter.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

internal class HomePresenter: HomePresenterInputProtocol {
    
    internal weak var view: HomePresenterOutputProtocol?
    internal var interactor: HomeInteractorInputProtocol?
    internal var coordinator: HomeCoordinatorProtocol?
    
    internal func searchByQuery(query: String?) {
        interactor?.searchByQuery(query: query)
    }
    
    internal func navigateToDetailsById(id: Int) {
        coordinator?.navigateToDetailsById(id: id)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func searchByQueryWithSuccess(shows: [ShowResponse]?) {
        guard let shows else { return }
        view?.showSearchResults(shows: shows)
    }
    
    internal func searchByQueryFailure(error: Error) {
        view?.showError(message: error.localizedDescription)
    }
}
