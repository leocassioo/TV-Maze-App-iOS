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
    internal let collectionManager: CastCollectionViewManager
    private let mainQueue: DispatchQueueProtocol
    
    internal init(presenter: ShowDetailsPresenterInputProtocol,
                  collectionManager: CastCollectionViewManager = CastCollectionViewManager(),
                  mainQueue: DispatchQueueProtocol = DispatchQueue.main) {
        self.presenter = presenter
        self.collectionManager = collectionManager
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
        detailView.castCollectionView.dataSource = collectionManager
        detailView.castCollectionView.delegate = collectionManager
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
            
            self.detailView.configView(title: viewModel.title, rating: viewModel.rating)
            self.detailView.configSummary(with: viewModel.summary)
            self.detailView.configGenres(genres: viewModel.genres)
            self.detailView.configPlayButton(playUrl: viewModel.playUrl)
            
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
                guard let placeholderImage = UIImage(named: "image_placeholder") else { return }
                self.detailView.configureImage(with: placeholderImage)
            }
        }
    }
    
    internal func dispayAliases(aliases: [AliaseModel]) {
        mainQueue.async {
            self.detailView.configAliases(with: aliases)
        }
    }
    
    internal func displayCast(cast: [CastModel]) {
        mainQueue.async {
            self.collectionManager.update(with: cast)
            self.detailView.configCast(cast: cast)
        }
    }
    
    internal func displayCastError() {
        detailView.configErrorCast()
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
