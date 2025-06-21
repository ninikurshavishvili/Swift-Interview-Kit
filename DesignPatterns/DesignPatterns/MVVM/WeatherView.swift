//
//  WeatherView.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 21.06.25.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Temperature: \(viewModel.weather)")
                .font(.title)
            Text("Condition: \(viewModel.weather.condition)")
                .font(.headline)
            
            Button("Refresh Weather") {
                viewModel.updateWeather()
            }
            .padding()
            .background(Color.primary)
            .cornerRadius(8)
        }
        .padding(20)
    }
}
