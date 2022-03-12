//
//  WTextField.swift
//  WeatherUIKit
//
//  Created by iYezan on 10/03/2022.
//

import UIKit

class WFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints   = false
        
        layer.cornerRadius  = 5
        layer.borderWidth   = 0.7
        layer.borderColor   = UIColor.systemGray4.cgColor
        
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 10
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        
        placeholder                 = "Search.."
    }
}
