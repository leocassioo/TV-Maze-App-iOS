//
//  ShowDetailsCoordinator.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit

public class ShowDetailsCoordinator {
    private let navigationController: UINavigationController
    private let showId: Int
    
    public init(navigationController: UINavigationController, showId: Int) {
        self.navigationController = navigationController
        self.showId = showId
    }
    
    public func start() {
        let interactor = ShowDetailsInteractor(showId: showId)
        
        let presenter = ShowDetailsPresenter()
        presenter.interactor = interactor
        interactor.output = presenter
        
        let showDetailsController = ShowDetailsViewController(presenter: presenter)
        presenter.view = showDetailsController
        
        navigationController.pushViewController(showDetailsController, animated: false)
    }
}
