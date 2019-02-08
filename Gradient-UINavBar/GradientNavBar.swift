//
//  GradientNavBar.swift
//  Gradient-UINavBar
//
//  Created by Leandro Oliveira on 2019-02-08.
//  Copyright © 2019 OliveiraCode Technologies. All rights reserved.
//

import UIKit


@IBDesignable
class GradientNavBar: UINavigationBar {
    
    let gradient = CAGradientLayer()
    
    @IBInspectable var leftGradientColor: UIColor = UIColor.clear {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var rightGradientColor: UIColor = UIColor.clear {
        didSet {
            setGradient()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    override var layer: CAGradientLayer {
        return super.layer as! CAGradientLayer
    }
    
    private func setGradient() {
        
        let gradient = CAGradientLayer()
        var bounds = self.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [leftGradientColor.cgColor, rightGradientColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        
        if let image = getImageFrom(gradientLayer: gradient) {
            self.setBackgroundImage(image, for: UIBarMetrics.default)
        }
        
    }
    
    func getImageFrom(gradientLayer:CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
}


