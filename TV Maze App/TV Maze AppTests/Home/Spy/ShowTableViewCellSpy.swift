//
//  ShowTableViewCellSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import UIKit
@testable import TV_Maze_App

final class ShowTableViewCellSpy: ShowTableViewCell {
    
    enum Method: Equatable {
        case configure
    }
    
    private(set) var calledMethods: [Method] = []
    private(set) var configureShow: Show?
    
    override func configure(with show: Show?) {
        calledMethods.append(.configure)
        configureShow = show
    }
}

