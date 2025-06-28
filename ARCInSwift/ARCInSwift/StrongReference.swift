//
//  StrongReference.swift
//  ARCInSwift
//
//  Created by Nino Kurshavishvili on 27.06.25.
//

// Strong Reference
/*
რას გულისხმობს Strong Reference.
 1. კლასებში, ყველა pproperty-ს default-ად აქვს ძლიერი ბმა.
 2. ზრდის ობიექტის reference count-ის რაოდენობას.
 3. ⚠️ If two objects hold strong references to each other → ⚠️ retain cycle.
 (თუ ორ ობიქტს უჭირავს ძლიერი ბმით ერთმანეთი -> ეს იწვევს ⚠️ retain cycle-ს.
 

 
*/

class Teacher {
    let name: String
    init(name: String) {
        self.name = name
        print("👨‍🏫 Teacher \(name) initialized")
    }
    var student: Student?
    deinit {
        print("👨‍🏫 Teacher \(name) deinitialized")
    }
}

class Student {
    let name: String
    init(name: String) {
        self.name = name
        print("👧 Student \(name) initialized")
    }
    var teacher: Teacher? // <- STRONG reference!
    deinit {
        print("👧 Student \(name) deinitialized")
    }
}

func runStrongReferenceExample() {
    var t: Teacher? = Teacher(name: "Mr. Joe")
    var s: Student? = Student(name: "Nini")
    
    t?.student = s
    s?.teacher = t
    
    t = nil
    s = nil // ❌ deinit will NOT be called because of strong retain cycle
}

