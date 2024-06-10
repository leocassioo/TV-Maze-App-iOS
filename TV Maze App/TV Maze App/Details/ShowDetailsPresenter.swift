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
    private var showName: String?
    
    internal func viewDidLoad() {
        interactor?.fetchShowDetails()
        interactor?.fetchAliases()
        interactor?.fetchCast()
    }
    
    internal func didFetchShowDetails(showDetails: Show?) {
        let viewModel = ShowDetailsViewModel(
            title: showDetails?.name ?? "No Title",
            posterURL: showDetails?.image?.original,
            summary: showDetails?.summary ?? "No Summary",
            rating: "\(showDetails?.rating?.average ?? 0.0)",
            genres: showDetails?.genres,
            playUrl: showDetails?.officialSite
        )
        view?.displayShowDetails(viewModel: viewModel)
    }
    
    internal func didFailToFetchShowDetails(with error: Error) {
        view?.displayErrorAlert(message: error.localizedDescription)
    }
    
    internal func didFetchAliases(aliases: [AliaseModel]?) {
        guard let aliases else { return }
        view?.dispayAliases(aliases: aliases)
    }
    
    internal func didFailToFetchAliases(with error: Error) {
        view?.displayErrorAlert(message: error.localizedDescription)
    }
    
    internal func didFetchCast(cast: [CastModel]?) {
        guard let cast, !cast.isEmpty else {
            view?.displayCastError()
            return
        }
        view?.displayCast(cast: cast)
    }
    
    internal func didFailToFetchCast(with: Error) {
        view?.displayCastError()
    }
}
