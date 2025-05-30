//
//  CopyExample.swift
//  RetainVSCopyExamples
//
//  Created by Nino Kurshavishvili on 30.05.25.
//

import Foundation

//🧩 copy
/*
 დავუშვათ შევქმენით custom კლასს სტრინგით, რომლის გარედან მუტაციაც შესაძლებელია, თუ არ დაკოპირდება.
 */



import UIKit

// 2️⃣. შევქმენით custom კლასი რომელიც იღებს NSCopying - პროტოკოლს.
// ანუ შენ შეგიძლია ხელით გაუწერო და ისე განსაზღვრო როგორ შექმნა შენი კლასის კოპია.

class Task: NSCopying {
    var title: String = ""

    //copy(with - ქმნის ახალ ინსტანსს
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Task()
        //მივანიჭეთ ამ ახალ ინსტანსს იგივე სახელი (title).
        copy.title = self.title
        //დავაბრუნეთ ინსტანსის კოპია
        return copy
    }
    //ამის კეთება დაგვჭირდა რადგან Swift-მა არ იცის როგორ დააკოპიროს კლასი ავტომატურად, რადგან კლასი რეფერენს ტიპია.
}

// 1️⃣. როგორ მუშაობს viewmodel-ი NSMutableString ის გამოყენებით ?

class MyViewModel {
    private var internalString: NSMutableString

    //ინიციალიზერი იღებს mutable სტრინგს და ინახავს მას არა როგორც ობიექტის რეფერენნს არამედ როგორც კოპიას
    //ეს ნიშნავს რომ ორიგინალი სტრინგიც და ინტერნალ სტრინგიც არის ორი განსხვავებული ობიექტი მეხსიერებაში.
    //ცხადია თუ ორიგინალი სტრინგი შეიცვლება კოპია არ შეიცვლება.
    init(title: NSMutableString) {
        self.internalString = title.copy() as! NSMutableString
    }

    func printTitle() {
        print(internalString)
    }
}

class CopyExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mutable = NSMutableString(string: "Original")
        let viewModel = MyViewModel(title: mutable)
        mutable.setString("Changed")
        viewModel.printTitle()
        
        let task1 = Task()
        task1.title = "Workout"
        let task2 = task1.copy() as! Task
        task2.title = "Yoga"
        
        print(task1.title)
        print(task2.title)
    }
}
