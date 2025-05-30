//
//  ViewController.swift
//  RetainVSCopyExamples
//
//  Created by Nino Kurshavishvili on 30.05.25.
//

import UIKit

class ProfileViewModel {
    var name = "Nini"
}

class ViewController: UIViewController {
    var viewModel: ProfileViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileViewModel()
        print(viewModel?.name ?? "")
    }


}

