//
//  UINavigationControllerSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import UIKit
@testable import TV_Maze_App

final class UINavigationControllerSpy: UINavigationController {
    
    private(set) var pushViewControllerCalled = false
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushViewControllerCalled = true
    }
}
