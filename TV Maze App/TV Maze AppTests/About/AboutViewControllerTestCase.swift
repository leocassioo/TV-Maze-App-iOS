//
//  AboutViewControllerTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import SnapshotTesting
import XCTest
@testable import TV_Maze_App

final class AboutViewControllerTestCase: XCTestCase {
    
    var sut: AboutViewController!
    
    override func setUp() {
        super.setUp()
        sut = AboutViewController()
        
        isRecording = false
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_AboutViewControllerLoaded() {
        // When
        sut.viewDidLoad()
        
        // Then
        assertSnapshot(of: sut, as: .image(on: .iPhone13Pro))
    }
}

