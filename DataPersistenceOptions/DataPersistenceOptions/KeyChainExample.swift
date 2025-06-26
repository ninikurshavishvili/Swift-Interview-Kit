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
 შენი Custom ფუნქცია
 */
// MARK: - გამოყენების მაგალითი
/*
 პირველი ინსტალაცია Swift Package Manager-ის მეშვეობით
 In Xcode: File > Add Packages...
 URL-ის ჩასმა: https://github.com/evgenyneu/keychain-swift
 package-ის დამატება
 */

//მაგალითი 1: ფექიჯის გამოყენებით
import KeychainSwift
import Foundation
import Security

func keychainExample() {
    let keychain = KeychainSwift()
    
    // შენახვა
    keychain.set("my_secret_token", forKey: "authToken")
    
    // ამოღება (წაკითხვა)
    let token = keychain.get("authToken")
    
    // წაშლა
    keychain.delete("authToken")
}


//მაგალითი 2: შექმენით საკუთარი KeyChain helper კლასი

class KeychainHelper {
    static func save(_ value: String, forKey key: String) {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            SecItemDelete(query as CFDictionary) // Remove existing
            SecItemAdd(query as CFDictionary, nil)
        }
    }

    static func load(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess, let data = dataTypeRef as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    static func delete(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
func loadKeyChains() {
    KeychainHelper.save("NiniPassword123", forKey: "userPassword")
    let password = KeychainHelper.load(forKey: "userPassword")
    print(password ?? "No password found")
    
    KeychainHelper.delete(forKey: "userPassword")
}
