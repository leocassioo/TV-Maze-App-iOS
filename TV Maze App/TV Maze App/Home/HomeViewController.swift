//
//  HomeViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit

internal class HomeViewController: UIViewController {
    internal let homeView: HomeView
    private let presenter: HomePresenterInputProtocol
    internal let tableViewManager: HomeTableViewManager
    private let mainQueue: DispatchQueueProtocol
    
    private var isKeyboardShown = false
    
    internal init(presenter: HomePresenterInputProtocol,
                  tableViewManager: HomeTableViewManager = HomeTableViewManager(),
                  mainQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.homeView = HomeView()
        self.presenter = presenter
        self.tableViewManager = tableViewManager
        self.mainQueue = mainQueue
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
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
        let tableTapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tableTapGesture.cancelsTouchesInView = false
        homeView.tableView.addGestureRecognizer(tableTapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBarTitleView()
        
        if !isKeyboardShown {
            focusSearchBar()
            isKeyboardShown = true
        }
    }
    
    private func configureNavigationBarTitleView() {
        let logo = UIImage(named: "header_logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    internal func focusSearchBar() {
        mainQueue.async {
            self.homeView.searchBar.becomeFirstResponder()
        }
    }
    
    @objc internal func hideKeyboard() {
        mainQueue.async {
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
        mainQueue.async {
            self.tableViewManager.update(with: shows)
            self.homeView.tableView.reloadData()
            self.hideSkeleton()
        }
    }
    
    public func showError(message: String) {
        mainQueue.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
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
