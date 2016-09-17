//
//  ServicesURL.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

class ServicesURL {

	private let apiKey = "7f3647cb42b13f36b21d7a7014dbd7fb"
	private let cityId = "3078610" // Brno
	private let units = (metric: "metric", imperial: "imperial")

	private let baseURL = "http://api.openweathermap.org/data/2.5/"

	func actualServiceURL() -> String {
		let actualWeatherURL = "weather?id=\(cityId)&units=\(units.metric)&appid=\(apiKey)"
		return baseURL + actualWeatherURL
	}

	func forecastURL() -> String {
		let forecastURL = "forecast/daily?id=\(cityId)&units=\(units.metric)&appid=\(apiKey)"
		return baseURL+forecastURL
	}

}
