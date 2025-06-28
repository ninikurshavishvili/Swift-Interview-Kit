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
