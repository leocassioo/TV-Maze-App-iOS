//
//  ShowDetailsCoordinatorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowDetailsCoordinatorTestCase: XCTestCase {
    
    var sut: ShowDetailsCoordinator!
    var navigationControllerSpy: UINavigationControllerSpy!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = UINavigationControllerSpy()
        sut = ShowDetailsCoordinator(navigationController: navigationControllerSpy, showId: 1)
    }
    
    override func tearDown() {
        sut = nil
        navigationControllerSpy = nil
        super.tearDown()
    }
    
    func test_start_pushesShowDetailsViewController() {
        // When
        sut.start()
        
        // Then
        XCTAssertEqual(navigationControllerSpy.calledMethods, [.pushViewController])
        XCTAssertTrue(navigationControllerSpy.viewControllers.last is ShowDetailsViewController)
    }
}

