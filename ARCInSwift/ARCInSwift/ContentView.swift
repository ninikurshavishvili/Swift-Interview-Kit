//
//  ContentView.swift
//  ARCInSwift
//
//  Created by Nino Kurshavishvili on 27.06.25.
//

import SwiftUI

// რა არის ARC ზოგადა და როგორ მუშაობს ?

/*
 Strong, weak, და unowned რეფერენსები სინამდვილეში დაკავშირებულია მემონი მენეჯმენტთან რასაც ეწოდება ARC.
 ARC - Automatic Reference Counting - გულისხმობს რეფერენსების ავტომატურ დათვლას. (ანუ reference counting დაახლოებით pointer-ების დათვლა რომ წარმოვიდგინოთ). ' ანუ იმ adress-ების დათვლა რაც ობიექტამდე მემორიში გზას მიგვასწავლის'.
 მოკლედ ARC რეალურად ეხმარება რეფერენსების მეხსიერებაში შენახვას და გაწმენდას, როდესაც ის არ გამოიყენება.
 
 
 ⚠️ მთავარი ფაქტი ის არის რომ რეფერენსების დათვლა მხოლოდ class-ებთან არის შესაძლებელი. (რადგან strucs და enum value ტიპებია).
 
 ოფიციალური დოკუმენტაციიდან განმარტება :
 
 Memory management “just works” in Swift, and you do not need to think about memory management yourself. ARC automatically frees up the memory used by class instances when those instances are no longer needed.
 */


struct ContentView: View {
    var body: some View {
        VStack {

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
