//
//  ShowDetailsConstructorTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowDetailsConstructorTests: XCTestCase {

    func test_showDetailsConstructor_Path() {
        // Given
        let id = 1
        let constructor = ShowDetailsConstructor.showDetails(id: id)
        
        // When
        let path = constructor.path
        
        // Then
        XCTAssertEqual(path, "/shows/\(id)")
    }
    
    func test_aliasesConstructor_Path() {
        // Given
        let id = 1
        let constructor = ShowDetailsConstructor.aliases(id: id)
        
        // When
        let path = constructor.path
        
        // Then
        XCTAssertEqual(path, "/shows/\(id)/akas")
    }
    
    func test_showDetailsConstructor_Method() {
        // Given
        let constructor = ShowDetailsConstructor.showDetails(id: 1)
        
        // When
        let method = constructor.method
        
        // Then
        XCTAssertEqual(method, .get)
    }
    
    func test_aliasesConstructor_Method() {
        // Given
        let constructor = ShowDetailsConstructor.aliases(id: 1)
        
        // When
        let method = constructor.method
        
        // Then
        XCTAssertEqual(method, .get)
    }
    
    func test_showDetailsConstructor_Headers() {
        // Given
        let constructor = ShowDetailsConstructor.showDetails(id: 1)
        
        // When
        let headers = constructor.headers
        
        // Then
        XCTAssertEqual(headers, [:])
    }
    
    func test_aliasesConstructor_Headers() {
        // Given
        let constructor = ShowDetailsConstructor.aliases(id: 1)
        
        // When
        let headers = constructor.headers
        
        // Then
        XCTAssertEqual(headers, [:])
    }
    
    func test_showDetailsConstructor_Encoding() {
        // Given
        let constructor = ShowDetailsConstructor.showDetails(id: 1)
        
        // When
        let encoding = constructor.encoding
        
        // Then
        XCTAssertEqual(encoding, .urlEncoding)
    }
    
    func test_aliasesConstructor_Encoding() {
        // Given
        let constructor = ShowDetailsConstructor.aliases(id: 1)
        
        // When
        let encoding = constructor.encoding
        
        // Then
        XCTAssertEqual(encoding, .urlEncoding)
    }
    
    func test_showDetailsConstructor_Parameters() {
        // Given
        let constructor = ShowDetailsConstructor.showDetails(id: 1)
        
        // When
        let parameters = constructor.parameters
        
        // Then
        XCTAssertNil(parameters)
    }
    
    func test_aliasesConstructor_Parameters() {
        // Given
        let constructor = ShowDetailsConstructor.aliases(id: 1)
        
        // When
        let parameters = constructor.parameters
        
        // Then
        XCTAssertNil(parameters)
    }
}

