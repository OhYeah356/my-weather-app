//
//  InfoView.swift
//  MyWeatherApp
//
//  Created by Jan Vrzal on 17.09.16.
//  Copyright © 2016 OhYeah356. All rights reserved.
//

import UIKit
import SnapKit

class InfoView: UIView {

	let offset = 10

	let firstLabel: UILabel = {
		let label = UILabel()

		return label
	}()

	let secondLabel: UILabel = {
		let label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(17)
		return label
	}()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setView() {
		addSubview(firstLabel)
		addSubview(secondLabel)

		firstLabel.snp_makeConstraints { (make) in
			make.top.equalTo(0)
			make.centerX.equalTo(0)
			make.leading.equalTo(0)
		}

		secondLabel.snp_makeConstraints { (make) in
            make.top.equalTo(0)
            //make.centerX.equalTo(0)
            make.trailing.equalTo(0)
		}
	}
}
