//
//  ShadowLayer.swift
//  LayerTest
//
//  Created by 雷广 on 2017/7/6.
//  Copyright © 2017年 leiguang. All rights reserved.
//

import UIKit

class Shadow: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         一个 Layer 的 frame 是由它的 anchorPoint,position,bounds,和 transform 共同决定的，而一个 View 的 frame 只是简单的返回 Layer的 frame，同样 View 的 center和 bounds 也是返回 Layer 的一些属性。（PS:center有些特列）
         */
        
        let layer = CALayer()
        layer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        
        // border
        layer.borderWidth = 3;
        layer.borderColor = UIColor.green.cgColor
        layer.cornerRadius = 3
        
        // shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 1
        
        view.layer.addSublayer(layer)
    }
}
