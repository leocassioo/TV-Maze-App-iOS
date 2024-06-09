//
//  HomeInteractorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class HomeInteractorTestCase: XCTestCase {
    
    var sut: HomeInteractor!
    var networkServiceSpy: NetworkServiceSpy!
    var outputSpy: HomeInteractorOutputSpy!
    
    override func setUp() {
        super.setUp()
        networkServiceSpy = NetworkServiceSpy()
        outputSpy = HomeInteractorOutputSpy()
        sut = HomeInteractor(networkService: networkServiceSpy)
        sut.output = outputSpy
    }
    
    override func tearDown() {
        sut = nil
        networkServiceSpy = nil
        outputSpy = nil
        super.tearDown()
    }
    
    func test_searchByQuery_CallsNetworkServiceRequest() {
        // Given
        let query = "test"
        
        // When
        sut.searchByQuery(query: query)
        
        // Then
        XCTAssertEqual(networkServiceSpy.calledMethods, [.request])
    }
    
    func test_searchByQuery_WithSuccess_CallsOutputWithSuccess() {
        // Given
        let query = "test"
        let shows = [ShowResponse.dummy()]
        networkServiceSpy.resultToReturn = Result<[ShowResponse]?, Error>.success(shows)
        
        // When
        sut.searchByQuery(query: query)
        
        // Then
        XCTAssertEqual(outputSpy.calledMethods, [.searchByQueryWithSuccess])
        XCTAssertEqual(outputSpy.showsReceived?.first?.show?.id, shows.first?.show?.id)
    }
    
    func test_searchByQuery_WithFailure_CallsOutputWithFailure() {
        // Given
        let query = "test"
        let error = NSError(domain: "", code: 0, userInfo: nil)
        networkServiceSpy.resultToReturn = Result<[ShowResponse]?, Error>.failure(error)
        
        // When
        sut.searchByQuery(query: query)
        
        // Then
        XCTAssertEqual(outputSpy.calledMethods, [.searchByQueryFailure])
        XCTAssertEqual(outputSpy.errorReceived as NSError?, error)
    }
}
