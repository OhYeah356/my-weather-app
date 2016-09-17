//
//  ForecastView.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit

class ForecastView: UIView {
    
    let generalOffset = 5
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday"
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cloud")
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "28°"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dayLabel)
        addSubview(imageView)
        addSubview(temperatureLabel)
        
        dayLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0).offset(generalOffset)
            make.centerX.equalTo(0)
            
        }
        imageView.snp_makeConstraints { (make) in
            make.top.equalTo(dayLabel.snp_bottom).offset(generalOffset)
            make.centerX.equalTo(0)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        temperatureLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(0)
            make.bottom.equalTo(0).offset(-10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
