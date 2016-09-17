//
//  WeatherIcon.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

struct Icon {

	private let weatherImages = [UIImage(named: "Cloud"), UIImage(named: "FewClouds"), UIImage(named: "Mist"), UIImage(named: "Rain"), UIImage(named: "Storm"), UIImage(named: "Sun"), UIImage(named: "Snow")]

	func setActualIcon(actualIcon: String) -> String {

		var imageViewIcon = "Cloud"

		switch actualIcon {
		case "01d":
			imageViewIcon = "Sun"
		case "01n":
			imageViewIcon = "Moon"
		case "02d", "02n":
			imageViewIcon = "FewCloud"
		case "03d", "03n", "04d", "04n":
			imageViewIcon = "Cloud"
		case "09d", "09n", "10d", "10n":
			imageViewIcon = "Rain"
		case "11d", "11n":
			imageViewIcon = "Storm"
		case "13d", "13n":
			imageViewIcon = "Snow"
		case "50d", "50n":
			imageViewIcon = "Mist"
		default:
			imageViewIcon = "Cloud"
			print("Error: Problem in switch statesment actualIcon")
		}

		return imageViewIcon
	}

}
