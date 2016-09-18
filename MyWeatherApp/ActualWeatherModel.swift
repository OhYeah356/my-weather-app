//
//  ActualWeatherModel.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 16.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

struct ActualWeatherModel {
    
    let cityName: String
    let description: String
    let icon: String
    let windSpeed: Double
    let humidity: Int
    let minTemperature: Double
    let maxTemperature: Double
    let temperature: Double
    let pressure: Int
    
    init(cityName: String, description: String, icon: String, windSpeed: Double, humidity: Int, minTemperature: Double, maxTemperature: Double, temperature: Double, pressure: Int){
        self.cityName = cityName
        self.description = description
        self.icon = icon
        self.windSpeed = windSpeed
        self.humidity = humidity
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.temperature = temperature
        self.pressure = pressure
    }
}
