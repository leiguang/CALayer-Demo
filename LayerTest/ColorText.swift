//
//  ColorTextLayer.swift
//  LayerTest
//
//  Created by 雷广 on 2017/7/6.
//  Copyright © 2017年 leiguang. All rights reserved.
//

import UIKit

class ColorText: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = CALayer()
        container.frame = CGRect(x: 100, y: 100, width: 20, height: 100)
        view.layer.addSublayer(container)
        
        let  leftTop = CALayer()
        leftTop.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        leftTop.backgroundColor = UIColor.red.cgColor
        container.addSublayer(leftTop)
        
        let rightTop = CALayer()
        rightTop.frame = CGRect(x: 100, y: 0, width: 100, height: 50)
        rightTop.backgroundColor = UIColor.green.cgColor
        container.addSublayer(rightTop)
        
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: 50, width: 200, height: 50)
        bottom.backgroundColor = UIColor.blue.cgColor
        container.addSublayer(bottom)
        
        //
        let text = CATextLayer()
        text.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        text.string = "明月光"
        text.fontSize = 66
        text.isWrapped = true   // 多行显示，默认false
        text.foregroundColor = UIColor.green.cgColor
        
        // CALayer 的 mask 属性，用作 layer 的遮罩。
        // 这个遮罩和普通盖在上面的显示层不同，普通的遮罩是，盖上去，就遮住了下面的内容，而 mask 则是遮什么显示什么。
        // 也就是说只有mask的内容不透明的部分和layer叠加的部分才会显示出来
        container.mask = text
    }
}
