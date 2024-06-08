//
//  HomeInteractor.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import Foundation

internal class HomeInteractor: HomeInteractorInputProtocol {
    internal var output: HomeInteractorOutputProtocol?
    
    internal init() {
    }
    
    internal func searchByQuery(query: String?) {
        let constructor = HomeConstructor.search(query: query)
        
        NetworkService.shared.request(constructor: constructor) { (result: Result<[ShowResponse], Error>) in
            switch result {
            case .success(let shows):
                self.output?.searchByQueryWithSuccess(shows: shows)
            case .failure(let error):
                self.output?.searchByQueryFailure(error: error)
            }
        }
    }
}
