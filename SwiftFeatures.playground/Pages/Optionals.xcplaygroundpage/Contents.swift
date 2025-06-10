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


