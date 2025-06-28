//
//  UnownedReference.swift
//  ARCInSwift
//
//  Created by Nino Kurshavishvili on 28.06.25.
//

// Unowned Reference

/*
 რას გულისხმობს Unowned Reference
 

1. Unowned references do not retain the object (ობიექტს არ ინარჩუნებს).
2. weak-ისგან განსხვავებით, ის არასავალდებულოა, ამიტომ პროგრამა ვარაუდობს რომ ის ჯერ კიდევ მეხსიერებაშია.
3. საუკეთესოდ გამოიყენება, როცა ერთი ობიექტი მეორეზე მეტხანს უნდა გადარჩეს.
4. ⚠️ თუ ობიექტის დეალოკაცია მოხდა, და მასზე წვდომას ვცდით unowned რეფერენსით -> იწვევს პროგრამის დაქრაშვას
 [⚠️ If the object is deallocated and accessed via unowned → crash!]
 */

class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
        print("💳 Customer \(name) initialized")
    }
    deinit {
        print("💳 Customer \(name) deinitialized")
    }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer // <- unowned reference

    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
        print("💳 Card \(number) initialized for \(customer.name)")
    }
    deinit {
        print("💳 Card \(number) deinitialized")
    }
}

func runUnownedReferenceExample() {
    var c: Customer? = Customer(name: "Nini")
    c?.card = CreditCard(number: 1234567890, customer: c!)
    c = nil // 🔥 Card AND customer deinitialized
}
