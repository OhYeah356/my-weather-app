//
//  ViewController.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 16.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

	let weatherService = ActualWeatherService()
	let forecastService = ForecastService()
	let icon = Icon()
	let date = DateController()

    
    
	// UI Objects
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = .Gray
        return activityIndicator
    }()
    
	let temperatureLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFontOfSize(58)
		label.textColor = .blackColor()
		return label
	}()
	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFontOfSize(40)
		label.textColor = .whiteColor()
		return label
	}()

	let actualImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .ScaleAspectFit
		return imageView
	}()

	let separatingView: UIView = {
		let view = UIView()
		view.backgroundColor = .ceruleanBlue()
		return view
	}()

	// // Forecast Views
	let forecast1: ForecastView = {
		let view = ForecastView()
		return view
	}()

	let forecast2: ForecastView = {
		let view = ForecastView()
		return view
	}()

	let forecast3: ForecastView = {
		let view = ForecastView()
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setForecastViews()
		setView()
		
	}
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        getAndSetData()
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func setView() {
		// Set Navigation bar

        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: #selector(ViewController.getAndSetData))
        self.navigationItem.setLeftBarButtonItem(leftBarButton, animated: true)
        
		let rightBarButton = UIBarButtonItem(title: "Detail", style: .Plain, target: self, action: #selector(ViewController.nextPage))
		self.navigationItem.setRightBarButtonItem(rightBarButton, animated: true)
        
        // Set activity indicator
        activityIndicator.activityIndicatorViewStyle = .Gray
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
		// Set backgroud color
		view.backgroundColor = .whiteColor()

		view.addSubview(actualImageView)
		view.addSubview(separatingView)
		view.addSubview(temperatureLabel)
		view.addSubview(descriptionLabel)

		// View Layout
		actualImageView.snp_makeConstraints { (make) in
			make.top.equalTo(100)
			make.leading.equalTo(view)
			make.trailing.equalTo(view)
		}

		separatingView.snp_makeConstraints { (make) in

			make.leading.equalTo(view)
			make.trailing.equalTo(view)
			make.height.equalTo(100)
			make.bottom.equalTo(forecast1.snp_top)
		}

		temperatureLabel.snp_makeConstraints { (make) in
			make.centerX.equalTo(view)
			make.bottom.equalTo(separatingView.snp_top).offset(-10)
		}

		descriptionLabel.snp_makeConstraints { (make) in
			make.center.equalTo(separatingView)
		}
	}

	// Get and set data to UI from network

	func getAndSetData() {
        activityIndicator.startAnimating()
		weatherService.getAcutalForecastData { (result, error) in

			if result != nil {
				self.temperatureLabel.text = "\(Int(result!.temperature))°"
				self.descriptionLabel.text = result!.description.capitalizedString
				self.actualImageView.image = UIImage(named: (self.icon.setActualIcon(result!.icon)))
				self.title = result?.cityName
			} else {
                self.populateAlert("Error", message: error!.localizedDescription)
				print(error!.localizedDescription)
			}
            print("Actual weather data were updated")
		}
        
		forecastService.getForecast { (result, error) in
			if result != nil {
				self.forecast1.dayLabel.text = self.date.calculateTomorrow()
				self.forecast1.imageView.image = UIImage(named: self.icon.setActualIcon(result!.tomorrowIcon))
				self.forecast1.temperatureLabel.text = "\(Int(result!.tomorrowTemp))°"

				self.forecast2.dayLabel.text = self.date.calculateDayAfterTomorrow()
				self.forecast2.imageView.image = UIImage(named: self.icon.setActualIcon(result!.dayAfterTomIcon))
				self.forecast2.temperatureLabel.text = "\(Int(result!.dayAfterTomTemp))°"

				self.forecast3.dayLabel.text = self.date.calculateNextDayAfterTomorrow()
				self.forecast3.imageView.image = UIImage(named: self.icon.setActualIcon(result!.nextDayAftTomIcon))
				self.forecast3.temperatureLabel.text = "\(Int(result!.nextDayAftTomTemp))"
			} else {
				self.populateAlert("Error", message: error!.localizedDescription)
			}
            print("Forecast data were updated")
            self.activityIndicator.stopAnimating()
		}
	}

	func setForecastViews() {
		view.addSubview(forecast1)
		view.addSubview(forecast2)
		view.addSubview(forecast3)

		forecast1.snp_makeConstraints { (make) in
			make.height.equalTo(150)
			make.leading.equalTo(view).offset(50)
			make.bottom.equalTo(view)
		}

		forecast2.snp_makeConstraints { (make) in
			make.height.equalTo(150)
			make.centerX.equalTo(view)
			make.bottom.equalTo(view)
		}
		forecast3.snp_makeConstraints { (make) in
			make.height.equalTo(150)
			make.trailing.equalTo(view).offset(-50)
			make.bottom.equalTo(view)
		}
	}

	func nextPage() {
		let detailVC = DetailViewController()
		self.navigationController?.pushViewController(detailVC, animated: true)
	}
    
    // Alert View
    
    func populateAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction) -> Void in
        })
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: {
        })
    }
}