//
//  HomeCoordinator.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeCoordinator {
    
    internal let navigationController: UINavigationController
    
    internal init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        configureNavigationBar()
    }
    
    internal func start() {
        let interactor = HomeInteractor()
        
        let presenter = HomePresenter()
        presenter.interactor = interactor
        presenter.coordinator = self
        interactor.output = presenter
        
        let homeViewController = HomeViewController(presenter: presenter)
        presenter.view = homeViewController
        
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .tmDarkGray
        appearance.shadowColor = .clear
        
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    
    internal func navigateToDetailsById(id: Int) {
        let detailsCoordinator = ShowDetailsCoordinator(navigationController: navigationController, showId: id)
        detailsCoordinator.start()
    }
}

