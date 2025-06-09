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
 ✅ Memory Trick:
 "Static = shared across all (საერთოა ყველასთვის), like a label on the box. Instance = unique per object."
 
 static - ნიშნავს, რომ property ან მეთოდი ამ ტიპის კონკრეტულ instance-ს კი არ ეკუთნის არამედ ტიპს (სტრუქტურა, ენუმ) ეკუთნის. (მგონი უფრო მარტივად მისაწვდომია.?)
 მაგალითად პროტოკოლის გარეშე static მუშაობს ასე:
 
 struct Dog {
     static var speciesName = "Canis familiaris"
 }
 print(Dog.speciesName) // წვდომისთვის Dog ობიექტის შექმნა არ გჭირდებათ, speciesName Dog ტიპთანაა დაკავშირებული და არა კონკრეტულ dog-თან.
 */

// რას აკეთებს Static პროტოკოლებთან?

protocol Species {
    static var speciesName: String { get }
}

/*
 …it means:
 "Any type that adopts this protocol must have a type-level (static) property called speciesName."
 "ნებისმიერ ტიპს რომელიც იღებს ამ პროტოკოლს, უნდა ჰქონდეს Type-level ფროფერთი სახელად speciesName."
 */

struct Dog: Species {
    static let speciesName: String = "Canis familiaris"
}

// როდის გამოვიყენოთ Static პროტოკოლებთან?
/*
 უნდა გამოიყენო როდესაც ამ კონკრეტული ტიპის ყველა ინსტანსი იზიარებს ერთი და იგივე Value-ს ან Behavior-ს.
 მაგალითად :
 */

/*
 1. Type Describtions for objects (like label, tag)
 როდესაც გაქვს აპლიკაცია მაგალითად რაიმე პროდუქტების, რომლებსაც გააჩნიათ სხვადასხვა კატეგორია მაგალითად (Book, Movie, Podcast).
 */
protocol MediaType {
    static var typeName: String { get }
}

struct Book: MediaType {
    static let typeName = "Book"
}

struct Movie: MediaType {
    static let typeName = "Movie"
}

struct Podcast: MediaType {
    static let typeName = "Podcast"
}

print(Book.typeName) // Book
print(Movie.typeName) // Movie
/*
 2. Constants That Don't Depend on Instances
 როდესაც აპლიკაციაში იყენებ რამდენიმე API-ს და გინდა რომ ყველა API მოდდელმა გამოაცხადოს საკუთარი URL. შეგიძლია შექმნა ერთი protocol-ი static ცვლადით. და შეგიძლია დააორგანიზო ყველა API call სუფთად და თავიდან აიცილო URL-ების გაჰარდკოდება.
 */
protocol APIResource {
    static var baseURL: String { get }
}

struct UserAPI: APIResource {
    static let baseURL = "https://api.example.com/user"
}

struct ProductAPI: APIResource {
    static let baseURL = "https://api.example.com/product"
}

URL(string: UserAPI.baseURL + "/profile")

/*
 4. Reusability: TableView / CollectionView Cell Identifiers
 მაგალითად ჩვენ ხშირად გვჭირდება reuse identifiers (სტრინგის სახით), რომლის mistype შეიძლება ადვილად მოხდეს.
 და უფრო უსაფრთხო გზაა (ქვევით კოდში), ვიდრე პირდაპირ სტრინგი ჩაწერო "dafdefaw".
 */
protocol Reusable {
    static var reuseIdentifier: String { get }
}
//Default implementation
extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

//using

/*
 class MyCell: UITableViewCell, Reusable {}

 tableView.register(MyCell.self, forCellReuseIdentifier: MyCell.reuseIdentifier)

 */





//რა ხდება თუ Class-იყენებ?
/*
 თუ შენ ამუშავები კლასებს, შეგიძლია გამოიყენო როგორც static, iseve clas.
 ✅ class keyword -> უფლებას გაძლევს ქვეკლასის overriding მოახდინო
 ✅ static -> არ გაძლევს overriding-ის უფლებას
 
 მაგრამ პროტოკოლში Static-ს მაინც სტანდარტულად იყენებ
 
 protocol Species {
     static var speciesName: String { get }
 }

 */
class Cat: Species {
    class var speciesName: String {
        return "Felis catus"
    }
}


// Method Requirements

