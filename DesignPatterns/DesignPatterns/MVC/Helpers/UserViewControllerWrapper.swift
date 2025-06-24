//
//  UserViewControllerWrapper.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 21.06.25.
//
import SwiftUI
import UIKit

struct UserViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UserViewController {
        return UserViewController()
    }

    func updateUIViewController(_ uiViewController: UserViewController, context: Context) {
        // You usually leave this empty unless you want to update something dynamically
    }
}

