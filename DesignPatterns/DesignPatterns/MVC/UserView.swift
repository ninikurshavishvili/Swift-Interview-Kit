//
//  UserView.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 21.06.25.
//

import UIKit

class UserView: UIView {

    let nameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    func setupUI() {
        backgroundColor = .white
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)

        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func configure(with user: User) {
        nameLabel.text = "Hello, \(user.name)"
    }
}
