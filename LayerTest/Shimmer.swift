//
//  GradientLayer.swift
//  LayerTest
//
//  Created by 雷广 on 2017/7/6.
//  Copyright © 2017年 leiguang. All rights reserved.
//

import UIKit

class Shimmer: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 60, y: 150, width: 300, height: 100)
        gradient.colors = [UIColor.black.cgColor, UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 0.5, 1]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        view.layer.addSublayer(gradient)
        
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        textLayer.fontSize = 30
        textLayer.alignmentMode = "center"
        textLayer.string = "谁能共我醉一场 醉在此夜未央"
        textLayer.isWrapped = true
        gradient.mask = textLayer
        
        gradient.add(animation(), forKey: "LocationAnimation")
    }
    
    func animation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.5]
        animation.toValue = [0.5, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        return animation
    }
    
    //        gradient.locations = [0.25, 0.5, 0.75]
    //        animation.fromValue = [0.0, 0.0, 0.25]
    //        animation.toValue = [0.75, 1.0, 1.0]
}
