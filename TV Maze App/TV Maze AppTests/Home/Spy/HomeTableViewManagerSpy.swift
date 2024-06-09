//
//  HomeTableViewManagerSpy.swift
//  TV Maze AppTests
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import UIKit
@testable import TV_Maze_App

final class HomeTableViewManagerSpy: HomeTableViewManager {
    
    enum Method: Equatable {
        case update
        case tableViewNumberOfRowsInSection
        case tableViewCellForRowAt
        case tableViewDidSelectRowAt
    }
    
    private(set) var calledMethods: [Method] = []
    var shows: [ShowResponse] = []
    
    override func update(with shows: [ShowResponse]) {
        calledMethods.append(.update)
        self.shows = shows
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        calledMethods.append(.tableViewNumberOfRowsInSection)
        return shows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        super.update(with: shows)
        calledMethods.append(.tableViewCellForRowAt)
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        calledMethods.append(.tableViewDidSelectRowAt)
        super.update(with: shows)
        super.tableView(tableView, didSelectRowAt: indexPath)
    }
}

