//
//  HomeTableViewManager.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit

internal protocol HomeTableViewManagerDelegate: AnyObject {
    
    func didSelectedShow(id: Int)
    
}

internal class HomeTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    internal weak var delegate: HomeTableViewManagerDelegate?
    private var shows: [ShowResponse] = []
    
    internal func update(with shows: [ShowResponse]) {
        self.shows = shows
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.identifier, for: indexPath) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: shows[indexPath.row].show)
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let currentItem = shows[indexPath.row].show, let id = currentItem.id else { return }
        delegate?.didSelectedShow(id: id)
    }
}

