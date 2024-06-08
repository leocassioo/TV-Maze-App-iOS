//
//  ShowDetailsPresenter.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import Foundation

internal class ShowDetailsPresenter: ShowDetailsPresenterInputProtocol, ShowDetailsInteractorOutputProtocol {
    
    internal weak var view: ShowDetailsPresenterOutputProtocol?
    internal var interactor: ShowDetailsInteractorInputProtocol?
    
    internal func viewDidLoad() {
        interactor?.fetchShowDetails()
        interactor?.fetchAliases()
    }
    
    internal func didFetchShowDetails(showDetails: Show) {
        let viewModel = ShowDetailsViewModel(
            title: showDetails.name ?? "No Title",
            posterURL: showDetails.image?.original,
            summary: showDetails.summary ?? "No Summary",
            rating: "\(showDetails.rating?.average ?? 0.0)"
        )
        view?.displayShowDetails(viewModel: viewModel)
    }
    
    internal func didFailToFetchShowDetails(with error: Error) {
        // error
    }
    
    func didFetchAliases(aliases: [AliaseModel]) {
        view?.dispayAliases(aliases: aliases)
    }
    
    func didFailToFetchAliasese(with: any Error) {
        // error
    }
}

