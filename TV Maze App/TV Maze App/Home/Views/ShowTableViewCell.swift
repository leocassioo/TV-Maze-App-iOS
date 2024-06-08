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
        label.numberOfLines = 0
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .red
        return label
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    internal func configure(with show: Show?) {
        self.nameLabel.text = show?.name ?? ""
        self.statusLabel.text = show?.status ?? ""
        
    }
}
