//
//  ContentView.swift
//  GeometryReaderExample
//
//  Created by Nino Kurshavishvili on 12.09.25.
//

import SwiftUI



//რა არის GeometryReader SwiftUI-ში?

/*
 GeometryReader - არის SwiftUI-ს container view, რომელიც იძლევა წვდომას Child ელემენტის ზომასა და პოზიციაზე, მშობელი ვიუს კორდინანტთა სივრციდან.
 
 GeometryReader ძირითადად გამოიყენება:
 -> responsive layout-ის შესაქმნელად (ანუ როცა ვიუები device ზომას ერგებიან)
 -> ელემენტის დინამიურად განლაგება და პოზიციონირება
 -> ფარდობითი ზომის გამოსათვლელად, მაგალითად გახადო შვილობილი view მშობლის ზომის ნახევარი და ასე შემდგ..
 
 
 როგორ მუშაობს:
 
 როდესაც ვიუს wraping-ს უკეთებ GeometryReader-ში (ანუ when u wrap view in GeomeetryReader), ის იღებს closure-ს, რომელიც გაწვდის GeometryProxy ობიექტს.
 
 GeometryProxy გაძლევს ინფორმაციას კონტეინერის ზომასა და პოზიციის შესახებ, და შეგიძლია გამოიყენო ეს ინფორმაცია რომ დაა-custum-ო ვიუების განლაგაბა თუ მდებარება...
 
 GeometryProxy -> შეიცავს ინფორმაციას, როგორიცაა:
 -> size
 -> safeAreaInsets (safe area values (top, bottom, etc.)
 -> frame(in:) პოზიცია global და local კოორდინატთა სივრცეში
 
 _____________!___________
 GeometryReader იკევებს მთელ თaვისუფალ სივრცეს, თუ შეზღუდული არ არის. ამიტომ უმჯობესია მისი სხვა კონტეინერში (Vstack ან frame-ში მაგალითად) შეფუთვა.
 */


struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("width: \(geometry.size.width, specifier: "%.0f")")
                Text("width: \(geometry.size.height, specifier: "%.0f")")
            }
        }
    }
}

#Preview {
    ContentView()
}
