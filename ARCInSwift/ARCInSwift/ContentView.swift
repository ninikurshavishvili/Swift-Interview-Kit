//
//  ContentView.swift
//  ARCInSwift
//
//  Created by Nino Kurshavishvili on 27.06.25.
//

import SwiftUI

// რა არის ARC

/*
 Strong, weak, და unowned რეფერენსები სინამდვილეში დაკავშირებულია მემონი მენეჯმენტთან რასაც ეწოდება ARC.
 ARC - Automatic Reference Counting - გულისხმობს რეფერენსების ავტომატურ დათვლას. (ანუ reference counting დაახლოებით pointer-ების დათვლა რომ წარმოვიდგინოთ). ' ანუ იმ adress-ების დათვლა რაც ობიექტამდე მემორიში გზას მიგვასწავლის'.
 მოკლედ ARC რეალურად ეხმარება რეფერენსების მეხსიერებაში შენახვას და გაწმენდას, როდესაც ის არ გამოიყენება.
 
 
 ⚠️ მთავარი ფაქტი ის არის რომ რეფერენსების დათვლა მხოლოდ class-ებთან არის შესაძლებელი. (რადგან strucs და enum value ტიპებია).
 
 ოფიციალური დოკუმენტაციიდან განმარტება :
 
 Memory management “just works” in Swift, and you do not need to think about memory management yourself. ARC automatically frees up the memory used by class instances when those instances are no longer needed.
 */

// როგორ მუშაობს ARC?

/*
 ყოველ ჯერზე, როცა ვქმნით კლასის ინსტანსს init() გამოყენებით, ARC ავტომატურად გამოყოფს გარკვეულ ადგილს მემორიში. ანუ უფრო კონკრეტულად რომ ვთქვათ, მეხსიერების ეს ნაწილი ინახავს [ინსტანსს value propertie-ებთან ერთად].
 და როცა ინსტანსი აღარ იქნება საჭირო, გამოიძახება deinit() ფუნქცია რომელიც ასუფთავებს ამ ინსტანსის ადგილს მემორიში.
 */

/*
 ქვევით კოდის მაგალითი ეს არის ორი კლასის მაგალითი Person instance-ით. და Gadget instance-ით. Gadget ინსტანნს აქვს init მეთოდი, სადაც ის ასე ვთქვათ (sets) ინახავს Person ინსტანსის property-ის. და deinit სადაც ჩვენ დავინახავთ ინსტანსის დელოკაციას, რაც ნიშნავს, რომ ჩვენს შემთხვევაში ინფორმაციის შემცველი მეხსიერება თავისუფლდება.
 */



class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var gadget: Gadget?
    deinit {
        print("\(name) is being deinitialized")
    }
}
 
class Gadget {
    let model: String
    init(model: String) {
        self.model = model
        print("\(model) is being initialized")
    }
    var owner: Person?
    deinit {
        print("\(model) is being deinitialized")
    }
}

// ⚠️ Strong vs Weak vs Unowned — Quick Facts

/*
 1. როგორც წესი, როცა property იქმნება ის დეფაულტად ძლიერი ბმით იქმნება (strong reference-ით)
 
 2. property - რომელიც მონიშნულია როგორც weak, ეს არ გაზრდის
 
 3. unowned - reference იკავებს შუალედურ პოზიციას, არც ძლიერი ბმა აქვს და არც optional-ია, 
 */
