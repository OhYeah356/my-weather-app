//
//  DetailViewController.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	let weatherService = ActualWeatherService()

	let topOffSet = 35
	let offSet = 10

	let webView: UIWebView = {
		let webView = UIWebView()
		let requestURL = NSURL(string: "http://www2.brno.cz/kamery/malinak/tmp/image.jpg?")
		let request = NSURLRequest(URL: requestURL!)
		webView.scalesPageToFit = true
		webView.loadRequest(request)
		return webView
	}()

	let descriptionView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Description:"
		return view
	}()

	let mainTempView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Main Temperature:"
		return view
	}()

	let pressureView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Pressure:"
		return view
	}()

	let minTempView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Min. temperature:"
		return view
	}()

	let maxTempView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Max. temperature"
		return view
	}()

	let windSpeedView: InfoView = {
		let view = InfoView()
		view.firstLabel.text = "Wind speed"
		return view
	}()

	let separatingView: UIView = {
		let view = UIView()
		view.backgroundColor = .ceruleanBlue()
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setView()
		getAndSetData()
        let backButton = UIBarButtonItem(title: "Back", style: .Done, target: self, action: #selector(DetailViewController.back))
        self.navigationItem.leftBarButtonItem = backButton
	}

	func setView() {
		view.backgroundColor = .whiteColor()

		view.addSubview(webView)
		view.addSubview(separatingView)
		view.addSubview(descriptionView)
		view.addSubview(mainTempView)
		view.addSubview(pressureView)
		view.addSubview(minTempView)
		view.addSubview(maxTempView)
		view.addSubview(windSpeedView)

		webView.snp_makeConstraints { (make) in
			make.top.equalTo(view)
			make.height.equalTo(260)
			make.width.equalTo(view)
		}

		separatingView.snp_makeConstraints { (make) in
			make.top.equalTo(webView.snp_bottom)
			make.leading.equalTo(view)
			make.trailing.equalTo(view)
			make.height.equalTo(70)
		}

		descriptionView.snp_makeConstraints { (make) in
			make.top.equalTo(separatingView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
		mainTempView.snp_makeConstraints { (make) in
			make.top.equalTo(descriptionView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
		pressureView.snp_makeConstraints { (make) in
			make.top.equalTo(mainTempView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
		minTempView.snp_makeConstraints { (make) in
			make.top.equalTo(pressureView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
		maxTempView.snp_makeConstraints { (make) in
			make.top.equalTo(minTempView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
		windSpeedView.snp_makeConstraints { (make) in
			make.top.equalTo(maxTempView.snp_bottom).offset(topOffSet)
			make.leading.equalTo(view).offset(offSet)
			make.trailing.equalTo(view).offset(-offSet)
		}
	}

	// Get and set data to UI from network

	func getAndSetData() {
		weatherService.getAcutalForecastData { (result, error) in

			if result != nil {
				print(result!.description)
				self.descriptionView.secondLabel.text = result!.description.capitalizedString
				self.mainTempView.secondLabel.text = "\(Int(result!.temperature))°"
				self.pressureView.secondLabel.text = "\((result!.pressure)) p"
				self.minTempView.secondLabel.text = "\(Int(result!.minTemperature))°"
				self.maxTempView.secondLabel.text = "\(Int(result!.maxTemperature))°"
				self.windSpeedView.secondLabel.text = "\(Int(result!.windSpeed)) km/h"

				self.title = result!.cityName
			} else {
				self.populateAlert("Error", message: error!.localizedDescription)
				print(error!.localizedDescription)
			}
			print("Actual weather data were updated")
		}
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
    
    // Back button action
    
    func back(){
        navigationController?.popViewControllerAnimated(true)
    }
}
