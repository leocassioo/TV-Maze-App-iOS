//
//  HomeViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeViewController: UIViewController {
    private let customView: HomeView
    private let presenter: HomePresenterInputProtocol
    private let tableViewManager: HomeTableViewManager
    
    internal init(presenter: HomePresenterInputProtocol) {
        self.customView = HomeView()
        self.presenter = presenter
        self.tableViewManager = HomeTableViewManager()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    internal override func loadView() {
        self.view = customView
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        customView.searchBar.delegate = self
        customView.tableView.dataSource = tableViewManager
        customView.tableView.delegate = tableViewManager
        
        configureNavigationBarTitleView()
    }
    
    private func configureNavigationBarTitleView() {
        let logo = UIImage(named: "header_logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        showSkeleton()
        presenter.searchByQuery(query: query)
    }
}

extension HomeViewController: HomePresenterOutputProtocol {
    public func showSearchResults(shows: [ShowResponse]) {
        DispatchQueue.main.async {
            self.tableViewManager.update(with: shows)
            self.customView.tableView.reloadData()
            self.hideSkeleton()
        }
    }
    
    public func showError(error: Error) {
        DispatchQueue.main.async {
            // error
            self.hideSkeleton()
        }
    }
}

extension HomeViewController {
    
    private func showSkeleton() {
        customView.skeletonView.isHidden = false
    }
    
    private func hideSkeleton() {
        customView.skeletonView.isHidden = true
    }
}
