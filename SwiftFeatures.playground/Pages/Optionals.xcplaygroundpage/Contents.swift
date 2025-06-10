//: [Previous](@previous)

import Foundation

//Optionals

/*
 Optional-ები Swift-ის ძლიერი და სუპერ გამოსადეგი feature-ია. ის საშუალებას გვაძლევს რომ კოდში ცარიელი ან დაკარგული მნიშვნელობები დავამუშავოთ. ანუ Optional ცვლადს შეიძლება ქონდეს value ან შეიძლება იყოს nil.
 
აქ არის პატარა მაგალითი, თუ როგორ უნდა გამოვაცხადოთ და ვემუშაოთ optional-ებს
 */

var myOptional: Int?

myOptional = 3

if let myOptional {
    print(myOptional)
} else {
    print("nil")
}

myOptional = nil

if let myOptional {
    print(myOptional)
} else {
    print("nil")
}

//Optional Binding in Swift

/*
swift-ში optional ცვლადები წარმოადგენს მნიშვნელობის არსებობის ან არარსებობის შესძლებლობას.
 თუმცა, იმისთვის რომ optional ცვლადში შენახული მნიშვნელობა გამოიყენო, საჭიროა მისი unwrapping. optional binding - არის უსაფრთხო გზა რომ გააკეთო optional-ის unwrapping.
 
 პატარა მაგალითი თუ როგორ აკეთებს optional binding-ი safe unwraping-ს.
 */

let possibleString: String? = "hello optional"
if let realString = possibleString {
    print("\(realString)!")
} else {
    print("nil")
}

 /*
  ამ შემთხვევაში, ჩვენ unwapped მნიშვნელობას (არსებობის შემთხვევაში) ვინახავთ ახალ ცვლადში realString-ში, რომელიც უკვე არის კონსტანტა (let), და არა optional-ი.
  თუ optional მნიშვნელობა nil იქნებოდა, მაშინ პიველი პირობა არ შესრულდებოდა, მხოლოდ მეორე else ბლოკი შესრულდება.
  
  
  აღსაღნიშნია რომ, მიღებული პრაქტიკაა, რომ optional-ებს unwraping-ის დროს დაარქვა იგივე სახელი რაც optional-ს. მაგალითად აქ realString-ის ნაცვლად უნდა იყოს:
  if let  possibleString {
  print("\(possibleString)!")
}
  */

// Unwrap Multiple Optionals at Once

/*
 ცხადია ასევე შეგიძლიათ რამდენიმე ოფშენალის ერთდროული unwrap.
 
 თუ რომელიმე მაინც nil აღმოჩნდება მაშინ პირდაპირ გადავა კოდი else ბლოკში
 */

let message: String? = "helo"
let favouriteNumber: Int? = 42

if let message, let favouriteNumber {
    print("message: \(message), favouritenumber: \(favouriteNumber)")
} else {
    print("one of them is nill.")
}

//Force Unwrap Swift Optionals

/*
 ოფშენალის force unwrap ნიშნავს, რომ შენ წვდები ოფშენალ მნიშვნელობას, მისი nil-ობაზე შემოწმების გარეშე.
 ეს შეიძლება სასარგებლო იყოს იმ შემთხვევაში თუ 100% დარწმუნებული ხარ, რომ მნიშვნელობები ნილი არ არის, მაგრამ force unwrap არ არის კარგი პრაქტიკა და შეიძლება სახიფათო იყოს, რადგან თუ ნილი გაიპატა ეს runtime errors-ამოაგდებს.კონკრეტულად დაინახავ ამას, როდესაც ეცდები რომ optional set-ის unwrap გააკეთო "Fatal error: Unexpectedly found nil while unwrapping an Optional value."
 */

/**ამიტომ Force Unwrap-ის ნაცვლად ეცადეთ ყოველთვის გამოიყენოთ  Optional Binding ან the Nil-Coalescing Operator. და ზოგადად უფრო მიღებული პრაქტიკაა 'no force unwrap" :))* */


// რატომ გამოვიყენოთ Optional Chaining in Swift.

/*
 Optional Chaining - არის პროცესი, რომელიც გამოიყენება property-ების, მეთოდების subscript-ების ოფშენალზე (on optional) გამოძახებისვის, რომელიც ამჟამად შეიძლება იყოს nil. თუ optional-ი შეიცავს მნიშვნელობას, მაშინ ფროფერთები, მეთოდები ან საბსკრიპტები წარმატებით გამოიძახება; თუ ოფშენალი ნილი აღმოჩნდა მაშინ მეთოდი ან საბსკტიპტი დააბრუნებს ნილს.
 
 
 */

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

//შევქმენით Person-ის ობიექტი "john", თუმცა არ მიგვითითებია რომ მას აქვს Residence, ამიტომაც რადგან Residence მნიშვნელობა Optional-ია, ის ავტომატურად nil-ს იღებს
let john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

// ამიტომაც ლოგიკურად შესრულდება: Unable to retrieve the number of rooms.



//ახლა ობიექტს მივანიჭეთ residence ინსტანსი. ანუ john.residence? აღარ უდრის nil-ს.
john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
/**
 მცირე BreakDown of terminology if you are new in swift things :)) :
 
 john - არის Person კლასის instance
 residence - არის Residence კლასის optional property
 john.residence = Residence() - optional property-ის ინიციალიზაცია

 */


/*
 მნიშვნელოვანია, რომ Optional Chaining-ის გამოყენებისას დაიმახსოვროთ, რომ optional chaining-ის დროს დაბრუნებული მნიშვნელობა ყოველთვის იქნება Optional-ი (იქნება ეს ფროფერთები, მეთოდები თუ საბსკრიპტები).
 */

// რატომ გამოვიყენოთ nil-Coalescing Operator:

/*
 nil-coalescing operator - unwrap-ს უკეთებს optional-ს და აბრუნებს მის მნიშვნელობას (არსებობის შემთხვევაში), ან აბრუნებს Default მნიშვნელობას რომელსაც ჩვენ გავუწერთ unwrap-ის ლოგიკაში.
 
 nil-coalescing ძალიან გამოსადეგია ისეთ შემთხვევებში, როდესაც optional მნიშვნელობებს შეიძლება ნილის შემთხვევაში რაიმე default მნიშვნელობა მივანიჭოთ და ის ცარიელი აღარ იყოს. მაგალითად user input-ების დამუშაბევისთვის: თუ გაქვს შემთხვევა რომ უზერმა შეიძლება შეიყვანოს userName ან არ შეიყვანოს, თუ არ შეიყვანს მაშინ username default-ად გაუტოლდება რაიმე მნიშვნელობას მაგალითად "user31341341341".
 
 ამ ლოგიკის დამუშავების სინტაქსი ძალიან მარტივია, მხოლოდ იყენებ ??. მაგალითად 'optional value' ?? 'my default Value' 
 */

let name: String? = nil
let defaultName = "Anonymous"
let unwrappedName = name ?? defaultName
print(unwrappedName) // prints "Anonymous"
