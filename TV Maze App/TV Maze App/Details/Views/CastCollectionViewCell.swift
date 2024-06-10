//
//  CastCollectionViewCell.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 10/06/24.
//

import UIKit

internal class CastCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CastCollectionViewCell"
    
    internal let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    internal let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .tmWhite
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    internal let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .tmDarkGreen
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nicknameLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().inset(0)
        }
    }
    
    internal func configure(with castMember: CastModel) {
        nameLabel.text = castMember.person?.name ?? ""
        nicknameLabel.text = castMember.character?.name ?? ""
        imageView.image = nil
        
        if let imageUrlString = castMember.character?.image?.medium, let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        } else if let imageUrlString = castMember.person?.image?.medium, let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(named: "image_placeholder")
            }
        }
    }
}
