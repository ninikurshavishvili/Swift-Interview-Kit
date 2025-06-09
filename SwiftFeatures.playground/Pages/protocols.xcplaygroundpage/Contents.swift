//: [Previous](@previous)

import Foundation

// Protocols

/*
 Protocol - წარმოადგენს მეთოდების, property-ების, და მოთხოვნების Blueprint-ს, მაგალითად როგორც კონტრაქტი ->  მარტივად რომ ვთქვათ, პროტოკოლი არის გაწერილი მოთხოვნები, რომლებიც უნდა დააწმაყოფილოს იმ კლასსმა, სტრუქტურამ, enumeration, ტიპემბა რომელიც მიიღებს ამ პროტოკოლს.
 
 მაგალითად პროტოკოლებში შეჰიძლია გაწერო ასეთი ლოგილა ->

 "შენ შეგიძლია გქონდეს property - name მაგრამ ის აუცილებლად უნდა იყოს String."
 protocol SomeProtocol {
     var name: String { get }       // ⚠️Must be readable (gettable)
     var age: Int { get set }       // ⚠️Must be readable AND writable
 }

 პროტოკოლების საუკეთესო ნაწილი ის არის რომ შეგიძლია მისი გაფართოვება. ერთი პროტოკოლის შექმნის შემდეგ რომელიც გარჯვეულ მოთხოვნებს შეიცავს, შეგილია გააკეთო მისი გაფართოება და დაამატო სხვა მოთხოვნა ან ფუნქცია. ამით გექნება მეტი მოქნილობა.
 */

//ძირითადი სინტაქსი:
protocol SomeProtocol {
    // პროტოკოლებს ისე ვწერთ, როგორც კლასს სტრუქტურას ან ენამს
}
// როდესაც ქასთომ ტიპი იღებს პროტოკოლს განისაზღვრება ასეთი სინტაქსით
struct SomeStructure: SomeProtocol {

}
// თუ რამდენიმე პროტოკოლია მათი მძიმით გამოყოფა ხდება მაგალითად :
//struct SomeStructure: FirstProtocol, AnotherProtoco {}

//Property Requirements
/*
 get → ნიშნავს რომ, თქვენ უნდა შეძლოთ თვისების(requirements) წაკითხვა

 get set→ თქვენ უნდა შეძლოთ თვისების წაკითხვა და შეცვლა

 */

//✅ პროტოკოლი ერთადერთი get მოთხოვნით:
protocol ReadOnlyProtocol {
    var id: String { get } // Only needs to be readable
}

struct User: ReadOnlyProtocol {
    let id: String = "12345"
}

//✅ პროტოკოლი get setმოთხოვნით:
protocol EditableProtocol {
    var score: Int { get set } // უნდა იყოს readable(gettable) AND writable(settable)
}

struct Player: EditableProtocol {
    var score: Int = 0 //  იმუშავებს მხოლოდ Var-ის შემთხვევაში
}


// Static Property Requirements
/*
 
 static -> type-level
 static - ნიშნავს, რომ property ან მეთოდი თავად ტიპს ეკუთვნის და არა ამ ტიპის კონკრეტულ instance-ს.
 მაგალითად პროტოკოლის გარეშე static მუშაობს ასე:
 
 struct Dog {
     static var speciesName = "Canis familiaris"
 }

 print(Dog.speciesName) // წვდომისთვის Dog ობიექტის შექმნა არ გჭირდებათ, speciesName Dog ტიპთანაა დაკავშირებული და არა კონკრეტულ dog-თან.
 */


// Method Requirements

