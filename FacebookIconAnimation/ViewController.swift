//
//  ViewController.swift
//  FacebookIconAnimation
//
//  Created by SEAN on 2017/12/9.
//  Copyright © 2017年 SEAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let curvedView = CurvedView()
//        curvedView.backgroundColor = .yellow
//        view.addSubview(curvedView)
//        curvedView.frame = view.frame
        
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "thumbs_up"))
//        let dimension = drand48() * 10 + 20
//        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
//
//        let animation = CAKeyframeAnimation(keyPath: "position")
//        animation.duration = 2
//        animation.path = customPath().cgPath
//        animation.fillMode = kCAFillModeForwards
//        animation.isRemovedOnCompletion = false
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//
//        imageView.layer.add(animation, forKey: nil)
//
//        view.addSubview(imageView)
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "facebookLive"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc func handleTap() {
        (0...10).forEach { (_) in
            generateAnimationView()
        }
    }
    
    fileprivate func generateAnimationView() {
        
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "thumbs_up") : #imageLiteral(resourceName: "heart")
        let imageView = UIImageView(image: image)
        let dimension = drand48() * 10 + 20
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")

        animation.duration = 2 + drand48() * 3
        animation.path = customPath().cgPath
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }
}

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    
    path.move(to: CGPoint(x: 0, y: 200))
    
    let endPoint = CGPoint(x: 500, y: 200)
    
    let randomYshift = 200 + drand48() * 300
    let cp1 = CGPoint(x: 100, y: 100 - randomYshift)
    let cp2 = CGPoint(x: 200, y: 300 + randomYshift)
    
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    
    return path
}

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        //do some fancy curve drawing
        
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
    
}

