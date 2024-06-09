//
//  AppCoordinator.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class AppCoordinator {
    private let window: UIWindow
    private let tabBarController: UITabBarController
    
    internal init(window: UIWindow) {
        self.window = window
        self.tabBarController = UITabBarController()
        self.window.rootViewController = tabBarController
        configureTabBarAppearance()
    }
    
    internal func start() {
        let homeCoordinator = HomeCoordinator()
        
        tabBarController.viewControllers = [
            homeCoordinator.navigationController
        ]
        
        homeCoordinator.start()
        
        window.makeKeyAndVisible()
    }
    
    private func configureTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .tmDarkGray
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = .lightGray
        itemAppearance.selected.iconColor = .tmDarkGreen
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.tmDarkGreen]
        
        tabBarAppearance.stackedLayoutAppearance = itemAppearance
        tabBarAppearance.inlineLayoutAppearance = itemAppearance
        tabBarAppearance.compactInlineLayoutAppearance = itemAppearance
        
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        }
    }
}

