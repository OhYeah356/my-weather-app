//
//  ActualWeatherService.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 16.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ActualWeatherService {

	let serviceURL = ServicesURL()

    func getAcutalForecastData(completion: (result: ActualWeatherModel?, error: NSError?) -> ()) {

		Alamofire.request(.GET, serviceURL.actualServiceURL())
			.validate()
			.responseJSON { (response) in
				switch response.result {
				case .Success:

					guard let data = response.result.value else {
						break
					}

					let json = JSON(data)

					guard let cityName = json["name"].string,
						let description = json["weather"][0]["description"].string,
						let icon = json["weather"][0]["icon"].string,
						let windSpeed = json["wind"]["speed"].double,
						let temperature = json["main"]["temp"].double,
						let pressure = json["main"]["pressure"].int,
						let humidity = json["main"]["humidity"].int
					else {
						break
					}
					let weather = ActualWeatherModel(cityName: cityName, description: description, icon: icon, windSpeed: windSpeed, humidity: humidity, temperature: temperature, pressure: pressure)

					print(weather)
					completion(result: weather, error: nil)

				case .Failure(let error):
                    completion(result: nil, error: error)
                    print("Request failed with error:\(error)")
				}
		}
	}
}
