//
//  ShowDetailsViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit

internal class ShowDetailsViewController: UIViewController {
    internal let detailView = ShowDetailsView()
    private let presenter: ShowDetailsPresenterInputProtocol
    private let mainQueue: DispatchQueueProtocol
    
    internal init(presenter: ShowDetailsPresenterInputProtocol,
                  mainQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.presenter = presenter
        self.mainQueue = mainQueue
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
        detailView.showLoading()
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
    
    @objc internal func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

extension ShowDetailsViewController: ShowDetailsPresenterOutputProtocol {
    internal func displayShowDetails(viewModel: ShowDetailsViewModel) {
        mainQueue.async {
            self.detailView.titleLabel.text = viewModel.title
            self.detailView.ratingLabel.text = viewModel.rating
            
            self.detailView.configureSummary(with: viewModel.summary)
            self.detailView.configGenres(genres: viewModel.genres)
            self.detailView.configurePlayButton(playUrl: viewModel.playUrl)
            
            if let imageUrl = viewModel.posterURL, let url = URL(string: imageUrl) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.detailView.configureImage(with: image)
                            self.detailView.hideLoading()
                        }
                    }
                }
            } else {
                self.detailView.hideLoading()
            }
        }
    }
    
    internal func dispayAliases(aliases: [AliaseModel]) {
        mainQueue.async {
            self.detailView.configureAliases(with: aliases)
        }
    }
    
    internal func displayErrorAlert(message: String) {
        mainQueue.async {
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.backButtonTapped()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
