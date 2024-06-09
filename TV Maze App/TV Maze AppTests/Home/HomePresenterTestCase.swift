//
//  HomePresenterTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class HomePresenterTestCase: XCTestCase {
    
    var sut: HomePresenter!
    var viewSpy: HomeViewControllerSpy!
    var interactorSpy: HomeInteractorSpy!
    var coordinatorSpy: HomeCoordinatorSpy!
    
    override func setUp() {
        super.setUp()
        viewSpy = HomeViewControllerSpy()
        interactorSpy = HomeInteractorSpy()
        coordinatorSpy = HomeCoordinatorSpy()
        sut = HomePresenter()
        sut.view = viewSpy
        sut.interactor = interactorSpy
        sut.coordinator = coordinatorSpy
    }
    
    override func tearDown() {
        sut = nil
        viewSpy = nil
        interactorSpy = nil
        coordinatorSpy = nil
        super.tearDown()
    }
    
    func test_searchByQuery_CallsInteractorSearchByQuery() {
        // Given
        let query = "Test Query"
        
        // When
        sut.searchByQuery(query: query)
        
        // Then
        XCTAssertEqual(interactorSpy.calledMethods, [.searchByQuery(query: query)])
    }
    
    func test_navigateToDetailsById_CallsCoordinatorNavigateToDetailsById() {
        // Given
        let showId = 123
        
        // When
        sut.navigateToDetailsById(id: showId)
        
        // Then
        XCTAssertEqual(coordinatorSpy.calledMethods, [.navigateToDetailsById])
    }
    
    func test_searchByQueryWithSuccess_CallsViewShowSearchResults() {
        // Given
        let shows = [ShowResponse.dummy()]
        
        // When
        sut.searchByQueryWithSuccess(shows: shows)
        
        // Then
        XCTAssertEqual(viewSpy.calledMethods, [.showSearchResults])
    }
    
    func test_searchByQueryFailure_CallsViewShowError() {
        // Given
        let error = NSError(domain: "", code: 0, userInfo: nil)
        
        // When
        sut.searchByQueryFailure(error: error)
        
        // Then
        XCTAssertEqual(viewSpy.calledMethods, [.showError])
    }
}
