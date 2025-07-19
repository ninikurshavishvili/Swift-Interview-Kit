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

// მოდი განვიხილოთ, რეალური კოსის მაგალითი. ვთქვათ გვინდა GenericListView კომპონენტის შექმნა აპლიკაციაში.

import SwiftUI

struct GenericListView<T> : View {
    
    let items: [T]
    
    var body: some View {
        List(items.indices, id: \.self) { index in
            Text(self.displayText(for: items[index]))
        }
    }
    
    func displayText(for item: T) -> String {
        return "Generic item"
    }
}

//ეს მუშაობს მაგრამ ძალიან Generic-არის, ამიტომ ახლა დავამატოთ conditional conformance რომ ვაჩვენოთ რელური value-ები, მხოლოდ იმ შემთხვევაში, როცა T : CustomStringConvertible.

extension GenericListView where T: CustomStringConvertible {
    func displayText(for item: T) -> String {
        return item.description
    }
}

//ახლა Swift იყენებს DisplayText-ს მხოლოდ მაშინ როცა T-შეესაბამება და იღებს CustomStringConvertible პროტოკოლს, (მაგალითად str int ან custom ტიპისთვის).


struct ContentView: View {
    var body: some View {
        VStack {
            Text("Strings")
                .font(.headline)
            GenericListView(items: ["Apple", "blueberry", "cherry"])
            
            Text("Custom Models")
                .font(.headline)
            
        }
    }
}

struct User {
    let name: String
}

extension User: CustomStringConvertible {
    var description: String { name }
}
