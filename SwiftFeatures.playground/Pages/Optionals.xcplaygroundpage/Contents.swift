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
 
 პატარა მაგალითი
 */
