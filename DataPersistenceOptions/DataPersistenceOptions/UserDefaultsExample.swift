//
//  UserDefaultsExample.swift
//  DataPersistenceOptions
//
//  Created by Nino Kurshavishvili on 25.06.25.
//

import Foundation
import SwiftUI

//რა არის UserDefaults

/*
 UserDefaults - არის მარტივი და მსუბუქი მონაცემთა შენახვის მექანიზმი. როდესაც მცირე რაოდენობით მონაცემების შენახვა გჭირდება მაგალითად Preference-ბი ან აპლიკაციის seting-ები, UserDefault- მარტივი და მოსახერხებელი ვარიანტია ასეთი დატას შენახვისთვის.
 
 ის მონაცემთა შესანახად გვთვაზობს key-value წყვილის მიდგომას. UserDefault- გამოიყენება მხოლოდ არასენსიტიური ინფორმაციაების შესანახად, და არ არის შესაფერისი დიდი მონაცემების ან დიდი სტრუქტურული ობიექტების შესანახად (ამისთვის CoreData ან Realm ან file system არის უფრო გამოსადეგი).
 
 დადებითი ნაწილი: 1) სიმარტივე - არის მარიტივი გამოსაყენებელი და აქვს მარტივი სინტაქსი, რაც მას იდეალურს ხდის მარტივად სტრუქტურირებული მონაცემების შესანახად.
 2) მდგრადობა - UserDefault-ში შენახული მონაცემები შენარჩუნებულია აპლიკაციის გაშვებასა და მოწყობილობის გადატვირთვის შემდეგაც.
 3) UserDefault- არ ეყრდნობა გარე ბიბლიოთეკებს ან ფრეიმვორკებს ის არის Build In feature.
 */

// როგორ გამოვიყენოთ UserDefaults
/*
 რეალურად არაფრის იმპორტი არ გჭირდება მაგისთვის, Foundation-ს მოყვება.
 */

// MARK: - 🧪 Example Usage
//saves Data
func storeSampleUserDefaultsData() {
    UserDefaults.standard.set("Nini", forKey: "username")
    UserDefaults.standard.set(true, forKey: "isLoggedIn")
    UserDefaults.standard.set(22, forKey: "userAge")
}
// ეს ფუნქცია ინახავს 3 key value=("Nini", true, 22) წყვილს.
// UserDefaults.standard.set ინახავს მნიშვნელობებს userdefault-ის მონაცემთა ბაზაში, კონკრეტული key-ის ქვეშ.           თუ მნიშვნელობა არის nil, სისტემა შლის გასაღების არსებულ მნიშვნელობას.
/*
 UserDefaultsპირდაპირ მხოლოდ შემდეგი ტიპების შენახვა შეძლია:
 String
 Int
 Bool
 Double
 Float
 URL
 Date
 Data
 Arrayდა Dictionary(მხოლოდ მაშნ თუ შეიცავს მხოლოდ ზემოთ ჩამოთვლილ ტიპებს)

 ❌ მას არ შეუძლია custom ტიპების ან ობიექტების პირდაპირ შენახვა. თქვენ დაგჭირდებათ მათი კონვერტაცია Dataან Codable -ის გამოყენება.


 */

//Loads Data
func loadSampleUserDefaultsData() {
    let name = UserDefaults.standard.string(forKey: "username") ?? "Unknown"
    let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    let age = UserDefaults.standard.integer(forKey: "userAge")
    
    print("Name: \(name)")
    print("Is Logged In: \(isLoggedIn)")
    print("Age: \(age)")
}

struct UserDefaultsExampleView: View {
    @AppStorage("username") var username: String = "DefaultUser"
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👋 Hello, \(username)")
                .font(.headline)
            
            Toggle("Logged In?", isOn: $isLoggedIn)
            
            Button("Change Name") {
                username = "Nini \(Int.random(in: 1...99))"
            }
        }
        .padding()
    }
}

/*
 struct-ში ხდება შემდეგი რამ:
 ვიყენებთ @AppStorage-ს - ის არის property wrapper SwiftUI-ში, და გამოიყენება UserDefault-ში შენახული მონაცემების წასაკითხად, რომელიც ავტომატურად გამოიძახება ვიუს განახლებისას ყოველ ჯერზე და მოაქვს განახლებული ინფორმაციები. ანუ ის აქტიურად აკვირდება UserDefault-ში არსებულ key-ებს და ანახლებს ინტერფეისს მომხმარებლისთვის.
 
 მაგალითად @AppStorage("username") var username: String = "DefaultUser" ეს დააკვირდება "username" key-ს და დააკვირდება და დაიჭერს მის განახლებას ღილაკის ყოველ დაჭერაზე. [ისევე როგორც @AppStorage("isLoggedIn") var isLoggedIn: Bool = false "isLoggedIn" key-ს.] როგორც კი შეიცვლება
 
 ⚠️თუმცა, @AppStorage - (writes Data) გიწერს დატას UserDefault-ში და ამის გამო ის არ არის დაცვული Storage-ი. ამიტომაც არასოდეს შეინახოთ მნიშვნელოვანი პერსონალური ინფორმაცია @AppStorage-ის გამოყენებით.
 */
