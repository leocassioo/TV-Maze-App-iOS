//
//  HomeInteractor.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

internal class HomeInteractor: HomeInteractorInputProtocol {
    internal var output: HomeInteractorOutputProtocol?
    private let networkService: NetworkServiceProtocol
    
    internal init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    internal func searchByQuery(query: String?) {
        let constructor = HomeConstructor.search(query: query)
        
        networkService.request(constructor: constructor) { (result: Result<[ShowResponse], Error>) in
            switch result {
            case .success(let shows):
                self.output?.searchByQueryWithSuccess(shows: shows)
            case .failure(let error):
                self.output?.searchByQueryFailure(error: error)
            }
        }
    }
}
