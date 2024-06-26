//
//  HomeCoordinatorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class HomeCoordinatorTestCase: XCTestCase {
    
    var sut: HomeCoordinator!
    var navigationControllerSpy: UINavigationControllerSpy!
    
    override func setUp() {
        super.setUp()
        navigationControllerSpy = UINavigationControllerSpy()
        sut = HomeCoordinator(navigationController: navigationControllerSpy)
    }
    
    override func tearDown() {
        sut = nil
        navigationControllerSpy = nil
        super.tearDown()
    }
    
    func test_start_SetsUpViewControllerHierarchy() {
        // When
        sut.start()
        
        // Then
        XCTAssertEqual(navigationControllerSpy.viewControllers.count, 1)
        XCTAssertTrue(navigationControllerSpy.viewControllers.first is HomeViewController)
    }
    
    func test_navigateToDetailsById_PushesShowDetailsCoordinator() {
        // Given
        sut.start()
        let showId = 123
        
        // When
        sut.navigateToDetailsById(id: showId)
        
        // Then
        XCTAssertTrue(navigationControllerSpy.calledMethods.contains(.pushViewController))
        XCTAssertEqual(navigationControllerSpy.viewControllers.count, 2)
        XCTAssertTrue(navigationControllerSpy.viewControllers.last is ShowDetailsViewController)
    }
}

