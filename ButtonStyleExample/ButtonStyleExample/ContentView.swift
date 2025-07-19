//
//  ContentView.swift
//  ButtonStyleExample
//
//  Created by Nino Kurshavishvili on 19.07.25.
//

// რა არის ButtonStyle

/*
 ButtonStryle - არის პროტოკოლი SwiftUI-ში, რომელიც საშუალებას გაძლევს შექმნა შენი Custom დიზაინი ან ინტერაქციები ღილეკებისთვის.
 შეგიძლია ერთი სტილი განსაზღვრო შენი button-ისთვის და შემდეგ დაადო ღილაკებს, როცა დაგჭირდება. ამით აღარ მოგიწევს სათითაოდ უცვალო ღილაკებს სტილები აპლიკაციაში
 */

// კოდის მაგალითი თუ როგორ გამოვიყენოთ.
// შევქმნათ custom სტილი რომელიც იღებს ButtonStyle პროტოკოლს.

import SwiftUI

struct MyCustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


/*
 configuration.label - ღილაკის კონტენტი.
 
 ახლა გამოვიყენოთ ჩვენი custom ღილაკის სტილი View-ში.
 */

struct ButtonStyleExampleView: View {
    var body: some View {
        VStack {
            Button("Click me") {
                print("clicked")
            }
            .buttonStyle(MyCustomButtonStyle())
            
            Button("another click") {
                print("another time clicked")
            }
            .buttonStyle(MyCustomButtonStyle())
        }
        .padding()
        
    }
}

#Preview {
    ButtonStyleExampleView()
}

