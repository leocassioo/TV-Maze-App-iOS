//
//  ShowDetailsInteractor.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import Foundation

internal class ShowDetailsInteractor: ShowDetailsInteractorInputProtocol {
    internal var output: ShowDetailsInteractorOutputProtocol?
    private let showId: Int
    private let networkService: NetworkServiceProtocol
    
    internal init(showId: Int,
                  networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.showId = showId
        self.networkService = networkService
    }
    
    internal func fetchShowDetails() {
        let constructor = ShowDetailsConstructor.showDetails(id: showId)
        
        networkService.request(constructor: constructor) { (result: Result<Show?, Error>) in
            switch result {
            case .success(let show):
                self.output?.didFetchShowDetails(showDetails: show)
            case .failure(let error):
                self.output?.didFailToFetchShowDetails(with: error)
            }
        }
    }
    
    internal func fetchAliases() {
        let constructor = ShowDetailsConstructor.aliases(id: showId)
        
        networkService.request(constructor: constructor) { (result: Result<[AliaseModel]?, Error>) in
            switch result {
            case .success(let aliases):
                self.output?.didFetchAliases(aliases: aliases)
            case .failure(let error):
                self.output?.didFailToFetchAliases(with: error)
            }
        }
    }
}
