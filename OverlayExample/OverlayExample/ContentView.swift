//
//  ContentView.swift
//  OverlayExample
//
//  Created by Nino Kurshavishvili on 02.07.25.
//

// განვიხილოთ Overlays ორი მნიშვნელობა: Overlays (OS/Memory Concept), Overlay in SwiftUI


// რა არის Overlay (სისტემის ნაწილში) :
/*
 დაბალი დონის სისტემებში ( მაგალითად, ჩაშენებული სისტემები ან ადრეული ოპერაციული სისტემები):
 | Overlay (გადაფარვები) არის ტექნიკა რომელიც-> გამოიყენება დიდი პროგრამის წანილებად დასაშლელად და მეხსიერებაში მხოლოდ საჭირო პროგრამის ნაწილის ჩასატვირთად.
 | ზოგავს მემორის, მხოლოდ ამჟამად საჭირო კოდის ჩათვირთვით.
 | საუკეთესოა პატარა RAM-ის მქონე სისტემებისთვის.
 */


//რა არის .overlay() Swift-ში.

/*
 overlay() - არის midifier, რომელიც ამატებს ახალ ვიუს, უკვე არსებული ვიუს ზემოდან, როგორც როგორც ახალი layer.
 
 ძირითადი Use Cases:
 Add a border

 Add a label on top of an image

 Add a semi-transparent mask or background

 Display loading spinners or alerts
 */

import SwiftUI

struct ContentView: View {
    @State private var isPressed = false
    
    var body:some View {
        VStack(spacing: 30) {
            Text("Overlay Example")
                .font(.largeTitle)
                .bold()
            
            ZStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.blue)
                    .overlay(
                        Text(" ONLINE ")
                            .font(.caption)
                            .padding(6)
                            .background(Color.white)
                            .cornerRadius(8)
                            .offset(x: 45, y: 45),
                        alignment: .bottomTrailing
                    )
            }
        }
    }
}
