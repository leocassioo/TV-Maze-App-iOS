//
//  HomeView.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 07/06/24.
//

import UIKit
import SnapKit

internal class HomeView: UIView {
    
    internal let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        view.barTintColor = .clear
        view.backgroundImage = UIImage()
        view.backgroundColor = .tmDarkGray
        view.placeholder = "Search here..."
        
        if let textField = view.value(forKey: "searchField") as? UITextField {
            textField.textColor = .label
            textField.tintColor = .label
            textField.backgroundColor = .systemGray6
            textField.attributedPlaceholder = NSAttributedString(
                string: textField.placeholder ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
            )
            
            textField.layer.cornerRadius = 10
            textField.clipsToBounds = true
        }
        
        return view
    }()
    
    internal let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    internal let skeletonView: SkeletonView = {
        let view = SkeletonView()
        view.isHidden = true
        return view
    }()
    
    internal init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    private func setupViews() {
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(skeletonView)
        
        backgroundColor = .tmBlack
        tableView.backgroundColor = .tmBlack
        
        tableView.register(ShowTableViewCell.self, forCellReuseIdentifier: ShowTableViewCell.identifier)
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        skeletonView.snp.makeConstraints { make in
            make.edges.equalTo(tableView)
        }
    }
}
