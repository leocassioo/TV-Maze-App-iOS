//
//  HomeViewControllerTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App
import SnapshotTesting

final class HomeViewControllerTestCase: XCTestCase {
    
    var sut: HomeViewController!
    var presenterSpy: HomePresenterSpy!
    var tableViewManagerSpy: HomeTableViewManagerSpy!
    var dispatchQueueSpy: DispatchQueueSpy!
    
    override func setUp() {
        super.setUp()
        presenterSpy = HomePresenterSpy()
        tableViewManagerSpy = HomeTableViewManagerSpy()
        dispatchQueueSpy = DispatchQueueSpy()
        sut = HomeViewController(presenter: presenterSpy, tableViewManager: tableViewManagerSpy, mainQueue: dispatchQueueSpy)
        _ = sut.view
        
        isRecording = false
    }
    
    override func tearDown() {
        presenterSpy = nil
        sut = nil
        tableViewManagerSpy = nil
        dispatchQueueSpy = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_ConfiguresTableViewAndSearchBar() {
        // Given
        let searchBarDelegate = sut.homeView.searchBar.delegate
        let tableViewDataSource = sut.homeView.tableView.dataSource
        let tableViewDelegate = sut.homeView.tableView.delegate
        
        // Then
        XCTAssertNotNil(searchBarDelegate)
        XCTAssertNotNil(tableViewDataSource)
        XCTAssertNotNil(tableViewDelegate)
        XCTAssertTrue(searchBarDelegate is HomeViewController)
        XCTAssertTrue(tableViewDataSource is HomeTableViewManager)
        XCTAssertTrue(tableViewDelegate is HomeTableViewManager)
    }
    
    func test_searchBarSearchButtonClicked_CallsPresenterSearchByQuery() {
        // Given
        sut.homeView.searchBar.text = "query"
        
        // When
        sut.searchBarSearchButtonClicked(sut.homeView.searchBar)
        
        // Then
        XCTAssertEqual(presenterSpy.calledMethods, [.searchByQuery])
    }
    
    func test_showSearchResults_ReloadsTableViewAndHidesSkeleton() {
        // Given
        let shows = [ShowResponse.dummy()]
        
        // When
        sut.showSearchResults(shows: shows)
        
        // Then
        XCTAssertEqual(tableViewManagerSpy.calledMethods, [.update, .tableViewNumberOfRowsInSection])
        XCTAssertEqual(sut.homeView.tableView.numberOfRows(inSection: 0), shows.count)
        XCTAssertTrue(sut.homeView.skeletonView.isHidden)
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
    }
    
    func test_showError_HidesSkeleton() {
        // Given
        let error = NSError(domain: "", code: 0, userInfo: nil)
        
        // When
        sut.showError(message: error.localizedDescription)
        
        // Then
        XCTAssertTrue(sut.homeView.skeletonView.isHidden)
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
    }
    
    func test_didSelectedShow_CallsPresenterNavigateToDetailsById() {
        // Given
        let shows = [ShowResponse.dummy()]
        tableViewManagerSpy.update(with: shows)
        sut.homeView.tableView.reloadData()
        
        // When
        sut.tableViewManager.tableView(sut.homeView.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertEqual(presenterSpy.calledMethods, [.navigateToDetailsById])
    }
    
    func test_focusSearchBar_CallsDispatchQueueAsync() {
        // When
        sut.focusSearchBar()
        
        // Then
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
    }
    
    func test_hideKeyboard_CallsDispatchQueueAsync() {
        // When
        sut.hideKeyboard()
        
        // Then
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
    }
    
    func test_cellForRowAt_ConfiguresCellWithShow() {
        // Given
        let shows = [ShowResponse.dummy()]
        tableViewManagerSpy.update(with: shows)
        sut.homeView.tableView.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.homeView.tableView.register(ShowTableViewCellSpy.self, forCellReuseIdentifier: ShowTableViewCell.identifier)
        
        // When
        let cell = sut.tableViewManager.tableView(sut.homeView.tableView, cellForRowAt: indexPath) as! ShowTableViewCellSpy
        
        // Then
        XCTAssertEqual(cell.calledMethods, [.configure])
        XCTAssertEqual(cell.configureShow?.id, shows[0].show?.id)
    }
    
    func test_HomeViewControllerSnapshot_Initial() {
        // Then
        assertSnapshot(of: sut, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_HomeViewControllerSnapshot_WithSearchResults() {
        // Given
        let shows = [ShowResponse.dummy()]
        sut.showSearchResults(shows: shows)
        
        // Then
        assertSnapshot(of: sut, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_HomeViewControllerSnapshot_ErrorState() {
        // Given
        let error = NSError(domain: "", code: 0, userInfo: nil)
        sut.showError(message: error.localizedDescription)
        
        // Then
        assertSnapshot(of: sut, as: .image(on: .iPhone13Pro, precision: 0.95))
    }


}
