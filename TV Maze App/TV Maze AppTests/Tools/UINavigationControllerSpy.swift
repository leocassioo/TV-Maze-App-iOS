//
//  UINavigationControllerSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import UIKit
@testable import TV_Maze_App

final class UINavigationControllerSpy: UINavigationController {
    
    enum Method: Equatable {
        case pushViewController
    }
    
    private(set) var calledMethods: [Method] = []
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        calledMethods.append(.pushViewController)
        super.pushViewController(viewController, animated: animated)
    }
}
