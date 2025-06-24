//
//  UserViewController.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 21.06.25.
//

import UIKit

class UserViewController: UIViewController {

    private let userView = UserView()
    private let user = User(name: "Nini")

    override func loadView() {
        self.view = userView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userView.configure(with: user)
    }
}

