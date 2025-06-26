//
//  KeyChainExample.swift
//  DataPersistenceOptions
//
//  Created by Nino Kurshavishvili on 26.06.25.
//

// რა არის KeyChain

/*
 აპლიკაციების შექმნისას ხშირად გჭირდებათ ისეთი სენსიტიური ინფორმაციის უსაფრთხოდ შენახვა, როგორიცაა პაროლები, API ტოკენები ან მომხმარებლის ავტორიზაციის მონაცემები. ასეთი მონაცემების დაუდევრად შენახვა შეიძლება სარისკო იყოს, მაგრამ Apple გთავაზობთ მოსახერხებელ ინსტრუმენტს ამ ინფორმაციის უსაფრთხოებისთვის: Keychain.
 
 KeyChain - არის მონაცემების შენახვის დაშიფრული Storage, სადაც ვინახავთ ისეთ მნიშვნელოვან მონაცემებს, როგორებიცაა პაროლები, ტოკენები და სხვა. ის სპეციალურად შექმნილია სენსიტიური დატას შესანახად რადგან არის encrypted და Secured iOS-ის მიერ.
 
 | Use Case                          | Store in Keychain? |
 | --------------------------------- | ------------------ |
 | Username or email (not sensitive) | ❌                 |
 | Access token or auth token        | ✅                 |
 | Password or PIN                   | ✅                 |
 | Login state flag (`isLoggedIn`)   | ❌                 |
 | Biometric auth preference         | ✅                 |
 */

// MARK: - როგორ გამოვიყენოთ KeyChain ?

/*
 KeyChain-ის ისე პირდაპირი გამოყენება, როგორც UserDefault-ის, არ შეგვიძლია ის იყენებს C-Based API-ებს.
 მაგრამ არსებობს Wrapper-ებიც:
 KeychainSwift
 KeychainAccess
 ან შენი Custom ფუნქცია
 */
