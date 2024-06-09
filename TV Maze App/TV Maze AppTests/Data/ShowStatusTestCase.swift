//
//  ShowStatusTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowStatusTests: XCTestCase {
    
    func test_displayColor() {
        XCTAssertEqual(ShowStatus.running.displayColor, UIColor.green, "Running status should have green color")
        XCTAssertEqual(ShowStatus.ended.displayColor, UIColor.red, "Ended status should have red color")
        XCTAssertEqual(ShowStatus.toBeDetermined.displayColor, UIColor.orange, "To Be Determined status should have orange color")
        XCTAssertEqual(ShowStatus.inDevelopment.displayColor, UIColor.blue, "In Development status should have blue color")
    }
    
    func test_displayFont() {
        XCTAssertEqual(ShowStatus.running.displayFont, UIFont.systemFont(ofSize: 14), "Running status should have system font of size 14")
        XCTAssertEqual(ShowStatus.ended.displayFont, UIFont.boldSystemFont(ofSize: 14), "Ended status should have bold system font of size 14")
        XCTAssertEqual(ShowStatus.toBeDetermined.displayFont, UIFont.systemFont(ofSize: 14), "To Be Determined status should have system font of size 14")
        XCTAssertEqual(ShowStatus.inDevelopment.displayFont, UIFont.systemFont(ofSize: 14), "In Development status should have system font of size 14")
    }
    
    func test_decodable() {
        let jsonData = """
        [
            { "status": "Running" },
            { "status": "Ended" },
            { "status": "To Be Determined" },
            { "status": "In Development" }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let shows = try decoder.decode([ShowWrapper].self, from: jsonData)
            XCTAssertEqual(shows[0].status, .running, "First status should be Running")
            XCTAssertEqual(shows[1].status, .ended, "Second status should be Ended")
            XCTAssertEqual(shows[2].status, .toBeDetermined, "Third status should be To Be Determined")
            XCTAssertEqual(shows[3].status, .inDevelopment, "Fourth status should be In Development")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}

private struct ShowWrapper: Decodable {
    let status: ShowStatus
}

