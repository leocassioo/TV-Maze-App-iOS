//
//  ShowDetailsPresenterTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowDetailsPresenterTestCase: XCTestCase {
    
    var sut: ShowDetailsPresenter!
    var viewSpy: ShowDetailsViewControllerSpy!
    var interactorSpy: ShowDetailsInteractorSpy!
    
    override func setUp() {
        super.setUp()
        viewSpy = ShowDetailsViewControllerSpy()
        interactorSpy = ShowDetailsInteractorSpy()
        sut = ShowDetailsPresenter()
        sut.view = viewSpy
        sut.interactor = interactorSpy
        interactorSpy.output = sut
    }
    
    override func tearDown() {
        viewSpy = nil
        interactorSpy = nil
        sut = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_CallsFetchShowDetailsAndFetchAliases() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(interactorSpy.calledMethods, [.fetchShowDetails, .fetchAliases, .fetchCast])
    }
    
    func test_didFetchShowDetails_CallsDisplayShowDetails() {
        // Given
        let show = Show.dummy()
        
        // When
        sut.didFetchShowDetails(showDetails: show)
        
        // Then
        XCTAssertEqual(viewSpy.calledMethods, [.displayShowDetails])
    }
    
    func test_didFetchAliases_CallsDisplayAliases() {
        // Given
        let aliases = [AliaseModel.dummy()]
        
        // When
        sut.didFetchAliases(aliases: aliases)
        
        // Then
        XCTAssertEqual(viewSpy.calledMethods, [.dispayAliases])
    }
}
