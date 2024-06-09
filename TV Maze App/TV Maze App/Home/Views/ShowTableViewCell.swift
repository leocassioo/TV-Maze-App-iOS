//
//  ShowTableViewCell.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 08/06/24.
//

import UIKit
import SnapKit

internal class ShowTableViewCell: UITableViewCell {
    
    static let identifier = "ShowTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .tmWhite
        label.numberOfLines = 0
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .red
        return label
    }()
    
    private let showImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        return imageView
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.snp.makeConstraints { make in
            make.width.equalTo(20)
        }
        return imageView
    }()
    
    private let skeletonView: SkeletonView = {
        let view = SkeletonView()
        view.isHidden = true
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    @available(*, unavailable)
    internal required init?(coder _: NSCoder) {
        return nil
    }
    
    private func setupViews() {
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(statusLabel)
        
        stackView.addArrangedSubview(showImageView)
        stackView.addArrangedSubview(textStackView)
        
        contentView.addSubview(stackView)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(skeletonView)
        
        contentView.backgroundColor = .tmBlack
        backgroundColor = .tmBlack
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-10)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        
        skeletonView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        hideSkeleton()
    }
    
    internal func configure(with show: Show?) {
        showSkeleton()
        
        self.nameLabel.text = show?.name ?? ""
        self.showImageView.image = nil
        
        if let status = show?.status {
            self.statusLabel.text = status.rawValue
            self.statusLabel.textColor = status.displayColor
            self.statusLabel.font = status.displayFont
        } else {
            self.statusLabel.text = ""
        }
        
        if let imageUrlString = show?.image?.medium, let imageUrl = URL(string: imageUrlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.showImageView.image = image
                        self.hideSkeleton()
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.showImageView.image = UIImage(systemName: "photo.tv")
                self.showImageView.tintColor = .gray
                self.hideSkeleton()
            }
        }
    }
    
    private func showSkeleton() {
        skeletonView.isHidden = false
    }
    
    private func hideSkeleton() {
        skeletonView.isHidden = true
    }
}

