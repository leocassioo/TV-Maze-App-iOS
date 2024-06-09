//
//  AboutViewController.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 09/06/24.
//

import UIKit
import SnapKit

internal class AboutViewController: UIViewController {
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tmBlack
        setupViews()
    }
    
    private func setupViews() {
        let nameLabel = UILabel()
        nameLabel.text = "Leonardo Figueiredo"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .tmWhite
        
        let roleLabel = UILabel()
        roleLabel.text = "Desenvolvedor iOS"
        roleLabel.font = UIFont.systemFont(ofSize: 18)
        roleLabel.textAlignment = .center
        roleLabel.textColor = .tmWhite
        
        let phoneLabel = UILabel()
        phoneLabel.text = "Telefone: (31) 98355-8266"
        phoneLabel.font = UIFont.systemFont(ofSize: 16)
        phoneLabel.textAlignment = .center
        phoneLabel.textColor = .tmWhite
        
        let linkedinLabel = UILabel()
        linkedinLabel.text = "LinkedIn"
        linkedinLabel.textColor = .blue
        linkedinLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        linkedinLabel.textAlignment = .center
        linkedinLabel.isUserInteractionEnabled = true
        let linkedinTap = UITapGestureRecognizer(target: self, action: #selector(openLinkedIn))
        linkedinLabel.addGestureRecognizer(linkedinTap)
        
        let emailLabel = UILabel()
        emailLabel.text = "Email: leocassio.af@gmail.com"
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.textAlignment = .center
        emailLabel.textColor = .tmWhite
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, roleLabel, phoneLabel, linkedinLabel, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc private func openLinkedIn() {
        if let url = URL(string: "https://www.linkedin.com/in/leocassioo") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
