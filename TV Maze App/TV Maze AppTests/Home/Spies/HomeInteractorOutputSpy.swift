//
//  HomeInteractorOutputSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import Foundation
@testable import TV_Maze_App

final class HomeInteractorOutputSpy: HomeInteractorOutputProtocol {
    
    enum Method: Equatable {
        case searchByQueryWithSuccess
        case searchByQueryFailure
    }
    
    private(set) var calledMethods: [Method] = []
    
    private(set) var showsReceived: [ShowResponse]?
    private(set) var errorReceived: Error?
    
    func searchByQueryWithSuccess(shows: [ShowResponse]) {
        calledMethods.append(.searchByQueryWithSuccess)
        showsReceived = shows
    }
    
    func searchByQueryFailure(error: Error) {
        calledMethods.append(.searchByQueryFailure)
        errorReceived = error
    }
}

