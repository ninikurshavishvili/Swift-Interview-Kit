//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// Static typing - ნიშნავს რომ თითოეული ცვლადის ტიპი ცნობილია კომპილაციის დროს - აპლიკაციის გაშვებამდე. Swift არის ზოგადად სტატიკურად ტიპირებული ანუ ეგ ნიშნავს რომ ყველა ცვლადის ან კონსტანტის ტიპი ფიქსირებულია მისი გამოცხადებისთანაბე.

/*
 მისი უპირატესობებია
 
 | Feature                   | Why it matters in real apps                           |
 | ------------------------- | -------------------------------------------------     |
 | 🛡️ Type safety            | ერორებს იჭერს კომპილაციის დროს, და არა გაშვების შემდეგ |
 | ⚡ Faster performance      | კომპილატორი ოპტიმიზაციას უკეთებს ზუსტი ტიპების ცოდნას |
 | 🧠 Better code completion | Xcode shows accurate suggestions                  |
 | 📐 Easier refactoring     | Type system helps you rename/change things safely |
 | ✅ Clarity                 | ყველამ იცის რა ცვლადი რა ტიპისაა             |

 */

//🎯 რეალურ ცხოვრებაში გამოყენება

//მაგალითად API responce მოდელი რომ შევქმნათ, Swift უზრუნველყოფს, რომ  JSON მონაცემები USER მოდელის შესაბამისი იქნება. თუ რამე ტიპების აცდება მოხდა კომპილაციის დროს მიიღებ ერორს და თავიდან აიცილებ ტიპის აცდენებს.

struct User: Codable {
    let id: Int
    let name: String
}

// თუმცა ⚠️ Static Typing ≠ No Flexibility
//კვლავ შეგიძლია გამოიყენო ასეთი რამ:

var anyValue: Any

//მაგრამ ამის დაწერით კარგავ type safety-ს.


anyValue = 5
anyValue = "hello" // Valid, but unsafe

// რა არის Type Safety
/*
 1. კომპილაციის დროს (გაშვებამდე) ამოწმებს ცვლადის ტიპებს -> დაიჭერ უფრო მეტ ბაგს და პრობლემას გაშვებამდე.
 2. Type Inference მაინც უსაფრთხოა თუ ცვლადს არ მიუთითებ ტიპს გამოცხადებისთანავე მაგ: let name = "nini" სვიფტმა უკვე იცის რომ name სტრინგია.
 3. Protocols and Generics არიან type safe. ანუ როდესაც წერ ჯენერიკ ფუნქციას T-ს გამოყენებით. T რაც არუნდა იყოს, აუცილებლად ერთი ტიპის უნდა დარჩეს.
 5.JavaScript-ისა და Python-ისგან განსხვავებით, Swift არც გამოიცნობს და არც გარდაქმნის ტიპებს თქვენთვის, თუ თქვენ არ მისცემთ მას ამის უფლებას:
 let number = 5
 let pi = 3.14
 // let result = number + pi ❌ Error: cannot add Int and Double

 */
