//
//  WButton.swift
//  WeatherUIKit
//
//  Created by iYezan on 10/03/2022.
//

import UIKit

class WSearchButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        self.contentVerticalAlignment   = .fill
        self.contentHorizontalAlignment = .fill
    }
}
