//
//  ShowDetailsView.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit
import SnapKit

internal class ShowDetailsView: UIView {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        return stackView
    }()
    
    internal let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    internal lazy var playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "play_button"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        button.isHidden = true
        return button
    }()
    
    internal let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .tmWhite
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    internal let genresStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    internal let aliasesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    internal let aliasesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .tmWhite
        label.numberOfLines = 0
        return label
    }()
    
    internal let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    internal let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .tmWhite
        return label
    }()
    
    internal let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .yellow
        return imageView
    }()
    
    internal let summaryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .tmWhite
        return label
    }()
    
    internal let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .tmWhite
        label.numberOfLines = 0
        return label
    }()
    
    internal let castLabel: UILabel = {
        let label = UILabel()
        label.text = "Cast"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .tmWhite
        label.numberOfLines = 0
        return label
    }()
    
    internal let castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CastCollectionViewCell.self, forCellWithReuseIdentifier: CastCollectionViewCell.identifier)
        return collectionView
    }()
    
    internal let skeletonView: SkeletonView = {
        let view = SkeletonView()
        view.isHidden = true
        return view
    }()
    
    internal var playUrl: String?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    private func setupViews() {
        addSubview(scrollView)
        addSubview(skeletonView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(posterImageView)
        posterImageView.addSubview(playButton)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(genresStackView)
        stackView.addArrangedSubview(aliasesStackView)
        stackView.addArrangedSubview(ratingStackView)
        stackView.addArrangedSubview(summaryTitleLabel)
        stackView.addArrangedSubview(summaryLabel)
        stackView.addArrangedSubview(castLabel)
        stackView.addArrangedSubview(castCollectionView)
        
        aliasesStackView.addArrangedSubview(aliasesLabel)
        
        ratingStackView.addArrangedSubview(starImageView)
        ratingStackView.addArrangedSubview(ratingLabel)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().inset(-60)
            make.width.equalTo(scrollView)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(10)
            make.size.equalTo(48)
        }
        
        starImageView.snp.makeConstraints { make in
            make.size.equalTo(24)
        }
        
        skeletonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        castCollectionView.snp.makeConstraints { make in
            make.height.equalTo(270)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension ShowDetailsView {
    
    @objc private func playButtonTapped() {
        if let playUrl, let url = URL(string: playUrl) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    internal func configView(title: String, rating: String) {
        titleLabel.text = title
        ratingLabel.text = rating
    }
    
    internal func configureImage(with image: UIImage) {
        posterImageView.image = image
        let aspectRatio = image.size.height / image.size.width
        let screenWidth = UIScreen.main.bounds.width
        let imageHeight = screenWidth * aspectRatio
        
        posterImageView.snp.remakeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(imageHeight)
        }
    }
    
    internal func configSummary(with htmlText: String) {
        if let data = htmlText.data(using: .utf8) {
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            if let attributedString = try? NSMutableAttributedString(data: data, options: options, documentAttributes: nil) {
                let fullRange = NSRange(location: 0, length: attributedString.length)
                attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: fullRange)
                attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: fullRange)
                summaryLabel.attributedText = attributedString
            }
        }
    }
    
    internal func configAliases(with aliases: [AliaseModel]) {
        guard !aliases.isEmpty else { return }
        let aliasesText = aliases.map { $0.name }.joined(separator: ", ")
        aliasesLabel.text = "Also known as: \(aliasesText)"
    }
    
    internal func configGenres(genres: [String?]?) {
        guard let genres = genres?.compactMap({ $0 }), !genres.isEmpty else { return }
        
        genresStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for genre in genres {
            let genreLabel = UILabel()
            genreLabel.text = genre
            genreLabel.backgroundColor = .tmDarkGreen
            genreLabel.textColor = .tmWhite
            genreLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            genreLabel.textAlignment = .center
            genreLabel.layer.cornerRadius = 4
            genreLabel.layer.masksToBounds = true
            genreLabel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
            
            genresStackView.addArrangedSubview(genreLabel)
        }
    }
    
    internal func configPlayButton(playUrl: String?) {
        guard playUrl != nil else { return }
        self.playUrl = playUrl
        playButton.isUserInteractionEnabled = true
        playButton.isHidden = false
        
    }
    
    internal func configCast(cast: [CastModel]) {
        castLabel.text = "\(titleLabel.text ?? "") - Cast"
        castCollectionView.reloadData()
    }
    
    internal func configErrorCast() {
        castLabel.isHidden = true
        castCollectionView.isHidden = true
    }
    
    internal func showLoading() {
        skeletonView.isHidden = false
    }
    
    internal func hideLoading() {
        skeletonView.isHidden = true
    }
}
