//
//  WeakReference.swift
//  ARCInSwift
//
//  Created by Nino Kurshavishvili on 28.06.25.
//

// Weak Reference
/*
 რას გულისხმობს Weak Reference
 
 1. სუსტი ბმა არასოდეს ზრდის reference count-ის რაოდენობას
 2. ის ყოველთვის არის optional-ი, რადგან ობიექტი რომელზეც ის მიუთითებს, შეიძლება გახდეს nil-ი როცა მისი დეალოკაცია მოხდება.
 3. საუკეთესოდ გამოიყენება, როდესაც child კლასით იჭერ parent-ის რეფერენსს (ანუ სხვა სიტყვებით, როცა ჩაილდ კლასი მშობელ კლასს მიმართავს) [ Best used when child holds reference to parent.].
 */

class Dog {
    let name: String
    init(name: String) {
        self.name = name
        print("🐶 Dog \(name) initialized")
    }
    var owner: Owner?
    deinit {
        print("🐶 Dog \(name) deinitialized")
    }
}

class Owner {
    let name: String
    init(name: String) {
        self.name = name
        print("👤 Owner \(name) initialized")
    }
    weak var pet: Dog? // <- weak reference
    deinit {
        print("👤 Owner \(name) deinitialized")
    }
}

func runWeakReferenceExample() {
    var dog: Dog? = Dog(name: "Rex")
    var owner: Owner? = Owner(name: "Nini")
    
    dog?.owner = owner
    owner?.pet = dog
    
    dog = nil  // 🗑 Dog is released
    owner = nil  // 🗑 Owner is also released (no retain cycle)
}
