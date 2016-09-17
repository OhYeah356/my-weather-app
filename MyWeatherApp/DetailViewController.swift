//
//  DetailViewController.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


    let webView: UIWebView = {
        let webView = UIWebView()
        let requestURL = NSURL(string: "http://www2.brno.cz/kamery/malinak/tmp/image.jpg?")
        let request = NSURLRequest(URL: requestURL!)
        //webView.frame = UIScreen.mainScreen().bounds
        webView.scalesPageToFit = true
    
        webView.loadRequest(request)
        return webView
    }()
    
    let descriptionView: InfoView = {
        let view = InfoView()
        view.firstLabel.text = "Hello"
        view.secondLabel.text = "Word"
        return view
    }()
    
    let mainTempView: InfoView = {
        let view = InfoView()
        return view
    }()
    
    let pressureView: InfoView = {
        let view = InfoView()
        return view
    }()
    
    let minTempView: InfoView = {
        let view = InfoView()
        return view
    }()
    
    let maxTempView: InfoView = {
        let view = InfoView()
        return view
    }()
    
    let windSpeedView: InfoView = {
        let view = InfoView()
        return view
    }()
    

	override func viewDidLoad() {
		super.viewDidLoad()
        setView()
	}
    
    func setView(){
        view.backgroundColor = .whiteColor()
        
        
        
        view.addSubview(webView)
        view.addSubview(descriptionView)
        
        webView.snp_makeConstraints { (make) in
            make.top.equalTo(view).offset(200)
            make.centerX.equalTo(view)
            make.height.equalTo(240)
            make.width.equalTo(view)
        }
        
        
        descriptionView.snp_makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
    }
}
