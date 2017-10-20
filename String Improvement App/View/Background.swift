//
//  Background.swift
//  String Improvement App
//
//  Created by Nomad on 10/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

@IBDesignable
class Background: UIView {
    
    // MARK: the variables able to changes dynamically in storyboard
    @IBInspectable var topColor: UIColor = UIColor.cyan {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = UIColor.green {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
