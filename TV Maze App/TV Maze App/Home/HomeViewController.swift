//
//  HomeViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeViewController: UIViewController {
    private let interactor: HomeInteractor
    private let customView: HomeView
    
    public init() {
        self.customView = HomeView()
        self.interactor = HomeInteractor()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    public override func loadView() {
        self.view = customView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        customView.searchBar.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }
}

extension HomeViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        interactor.searchShows(query: query)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

