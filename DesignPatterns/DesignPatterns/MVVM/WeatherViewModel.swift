//
//  WeatherViewModel.swift
//  DesignPatterns
//
//  Created by Nino Kurshavishvili on 21.06.25.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather
    
    init() {
        self.weather = .init(temperature: 20, condition: "sunny")
    }
    
    func updateWeather() {
        let conditions = ["sunny", "cloudy", "rainy", "snowy"]
        let newTemp = Double.random(in: 10...40)
        let newCondition = conditions.randomElement() ?? "sunny"
        
        weather = Weather(temperature: newTemp, condition: newCondition)
    }
}
