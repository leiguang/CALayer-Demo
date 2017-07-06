//
//  ShapePathLayer.swift
//  LayerTest
//
//  Created by 雷广 on 2017/7/6.
//  Copyright © 2017年 leiguang. All rights reserved.
//

import UIKit

class Mask: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.bounds.width
        let height = view.bounds.height
        
        let label = UILabel(frame: CGRect(x: 100, y: 120, width: 200, height: 500))
        label.textColor = .green
        label.numberOfLines = 0
        label.text = "1.首先UIView可以响应事件，Layer不可以.\n2.View和CALayer的Frame映射及View如何创建CALayer.\n3.UIView主要是对显示内容的管理而 CALayer 主要侧重显示内容的绘制。\n4.在做 iOS 动画的时候，修改非 RootLayer的属性（譬如位置、背景色等）会默认产生隐式动画，而修改UIView则不会。"
        view.addSubview(label)
        
        let maskBtn = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        maskBtn.backgroundColor = UIColor(white: 0, alpha: 0.7)
        maskBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(maskBtn)
        
        let path = UIBezierPath(rect: CGRect(x: 20, y: 20, width: width-40, height: height-40))
        path.append(UIBezierPath(arcCenter: CGPoint(x: width/2, y: 220), radius: 100, startAngle: 0, endAngle: CGFloat(3/2*Double.pi), clockwise: true).reversing())
        path.append(UIBezierPath(roundedRect: CGRect(x: 30, y: 400, width: width-60, height: 100), cornerRadius: 15).reversing())
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        maskBtn.layer.mask = shapeLayer
    }
    
    func click() {
        print("click")
    }
}

