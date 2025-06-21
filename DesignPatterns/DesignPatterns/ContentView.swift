//
//  ContentView.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 20.06.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UserViewControllerWrapper()
            .edgesIgnoringSafeArea(.all) // optional if you want it full-screen
    }
}


#Preview {
    ContentView()
}
