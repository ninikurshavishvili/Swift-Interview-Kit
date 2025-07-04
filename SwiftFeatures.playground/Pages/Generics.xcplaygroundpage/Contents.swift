//: [Previous](@previous)

import Foundation

//Generics

/*
 Generic-ების გამოყენებით შეგიძლია დაწერო კოდი რომელიც სხვადასხვა ტიპებს ემუშავება, და განუსაზღვრო სხვადასხვა requirements (მოთხოვნები) აპ ტიპებს რომლებსაც ემუშავები.
 
 Generic-ები საშუალებას გვაძლევს დავწეროთ ყველაზე მოქნილი და reusable ფუნქციები, რომელიც ემუშავება ყველა ტიპის ობიექტს. მისი გამოყენებით თავიდან ავირიდებთ დუბლიკატებს, გამეორებულ კოდის ფუნქციებს და პროექტის სტრუქტურაც მედაც სუფთა იქნება.
 Generic-ები Swift-ის ერთ-ერთი ყველაზე ძლიერი feture-ია და Swift-ის სტანდარტული librery generic კოდით არის აგებული. მაგალითად : Array, Dictionary ტიპები არის Generic კოლექციები. (ანუ შეგვიძლია შევქმნათ მასივი რომელიც შეიცავს Int მნიშვნელობებს ან string მნიშვნელობებს. ისვე როგორც Dictionary ნებისმიერი ტიპის key, value წყვილები.
 */

//პრობლემა რომელსაც უშუალოდ Generic-ები წყვეტენ

/** ფუნქცია გადაცვლის ჩვენს მიერ მიწოდებულ ორ მთელი რიცხვების მნიშვნელობებს*/
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

// მაგალთად

var x = 5
var y = 10

swapTwoInts(&x, &y)

print(x) //"10\n"
print(y) //"5\n"

// In-Out PARAMETERS
/* თუ გჭირდება მცირე ინფორმაცია რას აკეთებს inout ფუნქცია:
inout ნიშნავს რომ
*/
/**ფუნქციის პარამეტრები ნაგულისხმევად მუდმივებია. ფუნქციის პარამეტრის მნიშვნელობის შეცვლის მცდელობა ამ ფუნქციის შიგნიდან კომპილაციის დროს შეცდომას იწვევს. ეს ნიშნავს, რომ პარამეტრის მნიშვნელობის შეცდომით შეცვლა შეუძლებელია. თუ გსურთ, რომ ფუნქციამ შეცვალოს პარამეტრის მნიშვნელობა და გსურთ, რომ ეს ცვლილებები ფუნქციის გამოძახების დასრულების შემდეგაც შენარჩუნდეს, განსაზღვრეთ ეს პარამეტრი, როგორც in-out პარამეტრი .
*/


/* თუმცა თუ გინდა რომ String მნიშვნელობები გადაცვალო, ამისათვის დაგჭირდება მეტი ფუნქცია*/

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}


func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/* მთავარი რაც აქ უნდა დაიმახსოროთ არის: a და b მნიშვნელობები ორივე უნდა იყოს ერთი ტიპის (რადგანაც Swift Type Safe ენაა და არ გრთავს ნებას მაგალითად String და Double მნიშვნელლობები გადაცვალო ერთმანეთში, ეს გამოიწვევს Compile-time error-ს
 */

/*შეამჩნევდით რომ სამივე ფუნქცია გავს ერთმანეთს მხოლოდ Type-ებია განსხვავებული, სწორედ აქ შემოდის Generic კოდის ძალა. შემოგთავაზებთ ერთ ფუნქციას რომელიც მუშაობს ყველა ტიპისთივის
 */

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {

    let temporaryA = a
    a = b
    b = temporaryA
}
// <T> -> Declares that this is a generic function.
// T -> A generic placeholder for a data type.

// T-> აქ წარმოადგენს ფლეისჰოლდერს. იგი შეიძლება იყოს ყველა ტიპის (Str,Int... custom type).. T - თავისთავად არაფერს გულისხმობს იმის გარდა რომ იგი წარმოადგენს ფუნქციაში შემავალი მნიშვნელობების ერთ და იგივე ტიპს, ანუ a და b, ორივე უნდა იყოს ერთი (T) ტიპის.



// Generic Types

/*
 ზოგადი ფუნქციების გარდა Swift საშუალებას გაძლევს განსაზღვრო, შენი საკუთარი Generic-ტიპები. ესენი არიან custom კლასები, სტრუქტურები, ენამები, რომლებსაც შეუძლიათ ემუშაონ ნებისმიერ TYPE-ს, როგორც Array და Dictionary.
 ამ ნაწილში გიჩვენებთ თუ როგორ დაწეროთ Generic კოლექციის ტიპი, სახელწოდებით -> Stack.
 
 Stack - არის მონაცემთა სტრუქტურა, რომელიც მიყვება წესს "First in First out"(LIFO)
 Stack -> არის მნიშვნელობების დალაგებული მასივი (გავს array-ს), თუმცა ოპერაციების უფრო მეტი შეზღუდვა აქვს. მაგალიად: Array - საშუალებას იძლევა ელემენტების ჩამატების თუ წაშლის შესაძლებლობას მასივის ნებისმიერ ადგილას.
 თუმცა Stack - საშუალებას გაძლევს ახალი ელემენტი ჩაამატო მხოლოდ კოლექციის ბოლოში, ასევე წაშლის შემთხვევაშიც მხოლოდ ბოლო ელემენტის წაშლაა შესაძლებელი.
 */

//მნიშვნელოვანია რომ:
/*
Stack-ის კონცეფციას ფართოდ იყენებს UINAvigation Controller კლასი.
 როდესაც იყენებ UINavigationController-ს ის მართავს შენს ეკრანებს ანუ viewController-ებს stack-ის გამოყენებით
 
 მაგალითად:
 წარმოიდგინე რომ აპლიკაცია იწყება ასე:
 Stack: [HomeViewController]
 
 გადახვედი home-იდან profile-ზე:
 navigationController?.pushViewController(profileVC, animated: true)
 
 ახლა შენი Stack- გახდება:
 Stack: [HomeViewController, ProfileViewController]

 ახლა დააჭირე back button-ს:
 navigationController?.popViewController(animated: true)

 დაბრუდნი საწყის კონტროლლერზე:
 Stack: [HomeViewController]

 [Home, Profile, Settings] -> [Home, Profile] -> [Home]
 */

//მთავარი KEY მომენტი არის:
/*
pushViewController(_:animated:) → adds a view controller (top of stack)

popViewController(animated:) → removes the top view controller
*/




