//
//  ViewController.swift
//  AppState
//
//  Created by Nino Kurshavishvili on 30.05.25.
//

import UIKit

class ViewController: UIViewController {

    /*
     🕐 ერთხელ გამოიძახება , როდესაც View მეხსიერებაში ჩაიტვირთება.
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     ინტერფეისის ელემენტების დაყენება
     მონაცემების ჩატვირთვა
     ქვეხედების დამატება
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad triggered")
    }

    /*viewWillAppear(_:)
     🕐 გამოიძახება ყოველ ჯერზე, როდესაც view ეკრანზე გამოჩნდება (სანამ ის ხილული გახდება).
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     ანიმაციების დაწყება
     განაახლეთ ინტერფეისი ახალი მონაცემებით
     ნავიგაციის ზოლის დამალვა/ჩვენება
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear triggered")
    }
    /*👁️viewDidAppear(_:)
     🕐 გამოიძახება ეკრანზე view-ს გამოჩენისთანავე (ახლა მომხმარებლისთვის ხილული).
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     დაიწყეთ მომხმარებლის აქტივობის თვალყურის დევნება
     დაიწყეთ ანიმაციები, რომელთა ნახვაც აუცილებელია
     ტრიგერის ანალიტიკა
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear triggered")
    }

    /*👋viewWillDisappear(_:)
     🕐 გამოიძახება, როდესაც ხედი გაქრობის პირასაა (მომხმარებელი ტოვებს ხედს).
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     ცვლილებების შენახვა
     ანიმაციების ან ტაიმერების შეჩერება
     დავალებების პაუზა
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear triggered")
    }
    /*🚪viewDidDisappear(_:)
     🕐 გამოიძახეს ეკრანზე ხედის გაქრობის შემდეგ .
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     გამოშვების რესურსები
     ვიდეოს/აუდიოს შეჩერება
     UI ელემენტების გადატვირთვა*/
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear triggered")
    }
    /*🕐 გამოიძახება, როდესაც ხედვის კონტროლერი მეხსიერებიდან ამოღებულია (განულოკაციის შემდეგ).
     📌 გამოიყენეთ შემდეგი მიზნებისთვის:
     დამკვირვებლების წაშლა
     რესურსების გაწმენდა
     მეხსიერების გამართვის პრობლემები
     */
    deinit {
        print("ViewController is being deinitialized")
    }
    
}

