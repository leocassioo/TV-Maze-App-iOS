//
//  HomeConstructorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class HomeConstructorTestCase: XCTestCase {
    
    func test_searchConstructor_CorrectlyConfiguresProperties() {
        // Given
        let query = "testQuery"
        let constructor = HomeConstructor.search(query: query)
        
        // When
        let path = constructor.path
        let method = constructor.method
        let headers = constructor.headers
        let encoding = constructor.encoding
        let parameters = constructor.parameters
        
        // Then
        XCTAssertEqual(path, "/search/shows")
        XCTAssertEqual(method, .get)
        XCTAssertEqual(headers, [:])
        XCTAssertEqual(encoding, .urlEncoding)
        XCTAssertEqual(parameters?["q"] as! String, query)
    }
    
    func test_searchConstructor_WithNilQuery_ConfiguresEmptyQueryParameter() {
        // Given
        let constructor = HomeConstructor.search(query: nil)
        
        // When
        let parameters = constructor.parameters
        
        // Then
        XCTAssertEqual(parameters?["q"] as! String, "")
    }
}

