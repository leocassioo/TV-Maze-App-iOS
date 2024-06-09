//
//  ShowDetailsInteractorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowDetailsInteractorTestCase: XCTestCase {
    
    var sut: ShowDetailsInteractor!
    var networkServiceSpy: NetworkServiceSpy!
    var outputSpy: ShowDetailsInteractorOutputSpy!
    
    override func setUp() {
        super.setUp()
        networkServiceSpy = NetworkServiceSpy()
        outputSpy = ShowDetailsInteractorOutputSpy()
        sut = ShowDetailsInteractor(showId: 1, networkService: networkServiceSpy)
        sut.output = outputSpy
    }
    
    override func tearDown() {
        sut = nil
        networkServiceSpy = nil
        outputSpy = nil
        super.tearDown()
    }
    
    func test_fetchShowDetails_Success() {
        // Given
        let show = Show.dummy()
        networkServiceSpy.resultToReturn = Result<Show?, Error>.success(show)
        
        // When
        sut.fetchShowDetails()
        
        // Then
        XCTAssertEqual(networkServiceSpy.calledMethods, [.request])
        XCTAssertEqual(outputSpy.calledMethods, [.didFetchShowDetails])
    }
    
    func test_fetchShowDetails_Failure() {
        // Given
        let error = NSError(domain: "Test", code: 1, userInfo: nil)
        networkServiceSpy.resultToReturn = Result<Show?, Error>.failure(error)
        
        // When
        sut.fetchShowDetails()
        
        // Then
        XCTAssertEqual(networkServiceSpy.calledMethods, [.request])
        XCTAssertEqual(outputSpy.calledMethods, [.didFailToFetchShowDetails])
    }
    
    func test_fetchAliases_Success() {
        // Given
        let aliases = [AliaseModel(name: "Alias1", country: nil)]
        networkServiceSpy.resultToReturn = Result<[AliaseModel]?, Error>.success(aliases)
        
        // When
        sut.fetchAliases()
        
        // Then
        XCTAssertEqual(networkServiceSpy.calledMethods, [.request])
        XCTAssertEqual(outputSpy.calledMethods, [.didFetchAliases])
    }
    
    func test_fetchAliases_Failure() {
        // Given
        let error = NSError(domain: "Test", code: 1, userInfo: nil)
        networkServiceSpy.resultToReturn = Result<[AliaseModel]?, Error>.failure(error)
        
        // When
        sut.fetchAliases()
        
        // Then
        XCTAssertEqual(networkServiceSpy.calledMethods, [.request])
        XCTAssertEqual(outputSpy.calledMethods, [.didFailToFetchAliases])
    }
}
