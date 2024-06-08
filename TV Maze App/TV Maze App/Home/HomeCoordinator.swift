//
//  HomeCoordinator.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeCoordinator {
    internal let navigationController: UINavigationController
    
    internal init() {
        navigationController = UINavigationController()
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    }
    
    internal func start() {
        let interactor = HomeInteractor()
        
        let presenter = HomePresenter()
        presenter.interactor = interactor
        interactor.output = presenter
        
        let homeViewController = HomeViewController(presenter: presenter)
        presenter.view = homeViewController
        
        navigationController.pushViewController(homeViewController, animated: false)
    }
}

