//
//  ForecastService.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import Alamofire
import SwiftyJSON

class ForecastService {

	let serviceURL = ServicesURL()

	func getForecast(completion: (result: ForecastModel?, error: NSError?) -> ()) {

		Alamofire.request(.GET, serviceURL.forecastURL())
			.validate()
			.responseJSON { (response) in

				switch response.result {
				case .Success:

					guard let data = response.result.value else {
						break
					}
					let json = JSON(data)

					guard
					let tomorrowTemperature = json["list"][0]["temp"]["day"].double,
						let tomorrowIcon = json["list"][0]["weather"][0]["icon"].string,

						let dayAfterTomorrowTemp = json["list"][1]["temp"]["day"].double,
						let dayAftertomorrowIcon = json["list"][1]["weather"][0]["icon"].string,

						let nextDayAfterTomorrowTemp = json["list"][2]["temp"]["day"].double,
						let nextDayAftertomorowIcon = json["list"][2]["weather"][0]["icon"].string
					else {
						break
					}
					let forecast = ForecastModel(tomorrowTemp: tomorrowTemperature, tomorrowIcon: tomorrowIcon, dayAfterTomTemp: dayAfterTomorrowTemp, dayAfterTomIcon: dayAftertomorrowIcon, nextDayAftTomTemp: nextDayAfterTomorrowTemp, nextDayAftTomIcon: nextDayAftertomorowIcon)
					completion(result: forecast, error: nil)

				case .Failure(let error):
					completion(result: nil, error: error)
					print("Request failed with error:\(error)")
				}
		}
	}
}