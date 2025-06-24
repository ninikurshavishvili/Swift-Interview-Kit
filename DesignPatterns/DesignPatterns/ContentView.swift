//
//  ContentView.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 20.06.25.
//

import SwiftUI
//MVC Example
//struct ContentView: View {
//    var body: some View {
//        UserViewControllerWrapper()
//            .edgesIgnoringSafeArea(.all) // optional if you want it full-screen
//    }
//}

//MVVM Example
struct ContentView: View {
    var body: some View {
        WeatherView()
    }
}


#Preview {
    ContentView()
}
