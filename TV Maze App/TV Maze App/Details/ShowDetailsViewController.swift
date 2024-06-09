//
//  ShowDetailsViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit

internal class ShowDetailsViewController: UIViewController {
    private let detailView = ShowDetailsView()
    private let presenter: ShowDetailsPresenterInputProtocol
    
    internal init(presenter: ShowDetailsPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    internal required init?(coder _: NSCoder) {
        return nil
    }
    
    internal override func loadView() {
        self.view = detailView
        self.view.backgroundColor = .tmBlack
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupBackButton()
    }
    
    private func setupBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        detailView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(48)
        }
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension ShowDetailsViewController: ShowDetailsPresenterOutputProtocol {
    internal func displayShowDetails(viewModel: ShowDetailsViewModel) {
        DispatchQueue.main.async {
            self.detailView.titleLabel.text = viewModel.title
            self.detailView.ratingLabel.text = viewModel.rating
            
            self.detailView.configureSummary(with: viewModel.summary)
            
            if let imageUrl = viewModel.posterURL, let url = URL(string: imageUrl) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.detailView.configureImage(with: image)
                        }
                    }
                }
            }
        }
    }
    
    internal func dispayAliases(aliases: [AliaseModel]) {
        DispatchQueue.main.async {
            self.detailView.configureAliases(with: aliases)
        }
    }
}
