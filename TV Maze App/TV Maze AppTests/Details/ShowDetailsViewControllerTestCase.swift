//
//  ShowDetailsViewControllerTestCase.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import XCTest
@testable import TV_Maze_App

final class ShowDetailsViewControllerTestCase: XCTestCase {
    
    var sut: ShowDetailsViewController!
    var presenterSpy: ShowDetailsPresenterSpy!
    var dispatchQueueSpy: DispatchQueueSpy!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        presenterSpy = ShowDetailsPresenterSpy()
        dispatchQueueSpy = DispatchQueueSpy()
        sut = ShowDetailsViewController(presenter: presenterSpy, mainQueue: dispatchQueueSpy)
        
        navigationController = UINavigationController(rootViewController: UIViewController())
        navigationController.pushViewController(sut, animated: false)
        _ = sut.view
    }
    
    override func tearDown() {
        presenterSpy = nil
        dispatchQueueSpy = nil
        sut = nil
        navigationController = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_CallsPresenterViewDidLoad() {
        // Then
        XCTAssertEqual(presenterSpy.calledMethods, [.viewDidLoad])
    }
    
    func test_viewDidLoad_ShowsLoading() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertFalse(sut.detailView.skeletonView.isHidden)
    }
    
    func test_displayShowDetails_UpdatesDetailView() {
        // Given
        let viewModel = ShowDetailsViewModel(
            title: "Test Title",
            posterURL: "https://example.com/image.jpg",
            summary: "Test Summary",
            rating: "8.0",
            genres: ["Drama"]
        )
        
        // When
        sut.displayShowDetails(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
        XCTAssertEqual(sut.detailView.titleLabel.text, viewModel.title)
        XCTAssertEqual(sut.detailView.ratingLabel.text, viewModel.rating)
        XCTAssertEqual(sut.detailView.summaryLabel.text, viewModel.summary)
    }
    
    func test_displaysAliases_UpdatesDetailView() {
        // Given
        let aliases = [AliaseModel(name: "alias", country: nil)]
        
        // When
        sut.dispayAliases(aliases: aliases)
        
        // Then
        XCTAssertEqual(dispatchQueueSpy.calledMethods, [.async])
        XCTAssertEqual(sut.detailView.aliasesLabel.text, "Also known as: alias")
    }
    
    func test_backButtonTapped_PopsViewController_Updated() {
        // Given
        let rootViewController = UIViewController()
        navigationController = UINavigationController(rootViewController: rootViewController)
        
        // When
        sut.backButtonTapped()
        
        // Then
        XCTAssertEqual(navigationController.viewControllers.count, 1)
    }
}
