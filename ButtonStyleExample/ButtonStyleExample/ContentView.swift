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

/*
 "ButtonStyle is a SwiftUI protocol that helps create reusable, custom-styled buttons. You override the makeBody(configuration:) function to define how the button should appear and respond to user interaction. You then apply your style using .buttonStyle(MyStyle()) anywhere in your view hierarchy."
 */

/*
 ButtonStyleარის SwiftUI პროტოკოლი, რომელიც ხელს უწყობს მრავალჯერადი გამოყენების, მორგებული სტილის ღილაკების შექმნას. თქვენ ცვლით ფუნქციას makeBody(configuration:), რათა განსაზღვროთ, თუ როგორ უნდა გამოჩნდეს ღილაკი და როგორ უნდა რეაგირებდეს მომხმარებლის ურთიერთქმედებაზე. შემდეგ თქვენ იყენებთ თქვენს სტილს .buttonStyle(MyStyle())თქვენი ხედვის იერარქიის ნებისმიერი წერტილის გამოყენებით.“
 */
