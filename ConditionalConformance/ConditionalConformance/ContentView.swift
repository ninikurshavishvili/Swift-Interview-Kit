//
//  ContentView.swift
//  ConditionalConformance
//
//  Created by Nino Kurshavishvili on 02.07.25.
//


// რა არის Conditional Conformance (პირობითი შესაბამისობები)
/*
 Swift-ში Conditional Conformance გულისხმობს, რომ Generic ტიპი შეესაბამება პროტოკოლს მხოლოდ გარკვეულ პირპბებში. და რას ნიშნავს ეს : ეს ნიშნავს რომ ტიპი შეესაბამება პროტოკოლს მხოლოდ იმ შემთხვევაში, თუ მისი Generic პარამეტრიც ასევე შეესაბამება ამ პროტოკოლს.
 Conditional Conformance - გამოვიდა Swift 4.1 ვერსიასთან და ძირითადად გამოიყენება Array, Optional, და custom generic Struc და enum-ებთან.
 */

//მაგალითად, თუ გვაქვს რაიმე generic ტიპი და გვსურს, რომ ის შეესაბამებოდეს პროტოკოლს, მხოლოდ იმ შემთხვევაში, თუ T-ც შეესაბამება ამ პროტოკოლს. იმის ნაცვლად რომ force to always conform, უნდა დაწერო : extension SomeExtension: Someprotocol where T: Someprotocol { }

import SwiftUI



