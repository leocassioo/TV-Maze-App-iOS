//
//  ShowDetailsProtocols.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import Foundation

// MARK: - Presenter -> Interactor
internal protocol ShowDetailsInteractorInputProtocol: AnyObject {
    var output: ShowDetailsInteractorOutputProtocol? { get set }
    func fetchShowDetails()
    func fetchAliases()
}

// MARK: - Interactor -> Presenter
internal protocol ShowDetailsInteractorOutputProtocol: AnyObject {
    func didFetchShowDetails(showDetails: Show)
    func didFailToFetchShowDetails(with: Error)
    
    func didFetchAliases(aliases: [AliaseModel])
    func didFailToFetchAliasese(with: Error)
}

// MARK: - View -> Presenter
internal protocol ShowDetailsPresenterInputProtocol: AnyObject {
    var view: ShowDetailsPresenterOutputProtocol? { get set }
    var interactor: ShowDetailsInteractorInputProtocol? { get set }
    func viewDidLoad()
}

// MARK: - Presenter -> View
internal protocol ShowDetailsPresenterOutputProtocol: AnyObject {
    func displayShowDetails(viewModel: ShowDetailsViewModel)
    func dispayAliases(aliases: [AliaseModel])
}
