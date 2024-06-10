//
//  ShowDetailsViewControllerSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

@testable import TV_Maze_App

import Foundation
@testable import TV_Maze_App

final class ShowDetailsViewControllerSpy: ShowDetailsPresenterOutputProtocol {
    
    enum Method: Equatable {
        case displayShowDetails
        case dispayAliases
        case displayErrorAlert
        case displayCast
        case displayCastError
    }
    
    private(set) var calledMethods: [Method] = []
    private(set) var viewModelReceived: ShowDetailsViewModel?
    private(set) var aliasesReceived: [AliaseModel]?
    
    func displayShowDetails(viewModel: ShowDetailsViewModel) {
        calledMethods.append(.displayShowDetails)
        viewModelReceived = viewModel
    }
    
    func dispayAliases(aliases: [AliaseModel]) {
        calledMethods.append(.dispayAliases)
        aliasesReceived = aliases
    }
    
    func displayErrorAlert(message: String) {
        calledMethods.append(.displayErrorAlert)
    }
    
    func displayCast(cast: [CastModel]) {
        calledMethods.append(.displayCast)
    }
    
    func displayCastError() {
        calledMethods.append(.displayCastError)
    }
}
