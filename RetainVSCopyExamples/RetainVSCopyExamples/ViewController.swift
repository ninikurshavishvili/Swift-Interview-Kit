//
//  ViewController.swift
//  RetainVSCopyExamples
//
//  Created by Nino Kurshavishvili on 30.05.25.
//

import UIKit

//🧩 retain
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

//Retain - რეალური პროექტის მაგალითი
/*
პირველ რიგში, საჭიროა ვიცოდეთ, რომ Swift-ში ჩვენ აღარ ვწერთ retain-ს ხელით, ეს
 ავტომატურად ხდება Strong reference-ების გამოყენებით.
 
 აქ გვაქვს მარტივი viewModel-ის მაგალითი, რომელიც დაჭერილია ძლიერი რეფერენსით, ანუ
 ის მანამდე დარჩება მემორიში, სანამ viewController არსებობს
 
 თუ შექმნი viewmodel-ს სუსტი ბმით [weak var], ის გახდება nil, როგორც კი სხვა ობიექტიც შეინახავს მას.
 
 ⚪️ ძლიერი ბმა გამოიყენეთ მაშინ, როდესაც საჭიროა ამ ობიექტის შენარჩუნება, და თუ ის მთავარი წყაროა screen-ისთვის.
*/

