//
//  HomeViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeViewController: UIViewController {
    private let homeView: HomeView
    private let presenter: HomePresenterInputProtocol
    private let tableViewManager: HomeTableViewManager
    
    internal init(presenter: HomePresenterInputProtocol) {
        self.homeView = HomeView()
        self.presenter = presenter
        self.tableViewManager = HomeTableViewManager()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    internal override func loadView() {
        self.view = homeView
        self.view.backgroundColor = .tmBlack
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        homeView.searchBar.delegate = self
        homeView.tableView.dataSource = tableViewManager
        homeView.tableView.delegate = tableViewManager
        tableViewManager.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBarTitleView()
        focusSearchBar()
    }
    
    private func configureNavigationBarTitleView() {
        let logo = UIImage(named: "header_logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    private func focusSearchBar() {
        DispatchQueue.main.async {
            self.homeView.searchBar.becomeFirstResponder()
        }
    }
    
    private func hideKeyboard() {
        DispatchQueue.main.async {
            self.homeView.searchBar.resignFirstResponder()
        }
    }
    
}

extension HomeViewController: UISearchBarDelegate {
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        showSkeleton()
        presenter.searchByQuery(query: query)
        hideKeyboard()
    }
}

extension HomeViewController: HomePresenterOutputProtocol {
    public func showSearchResults(shows: [ShowResponse]) {
        DispatchQueue.main.async {
            self.tableViewManager.update(with: shows)
            self.homeView.tableView.reloadData()
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
        homeView.skeletonView.isHidden = false
    }
    
    private func hideSkeleton() {
        homeView.skeletonView.isHidden = true
    }
}

extension HomeViewController: HomeTableViewManagerDelegate {
    
    internal func didSelectedShow(id: Int) {
        presenter.navigateToDetailsById(id: id)
    }
}
