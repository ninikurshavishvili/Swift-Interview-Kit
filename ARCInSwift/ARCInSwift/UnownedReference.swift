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
