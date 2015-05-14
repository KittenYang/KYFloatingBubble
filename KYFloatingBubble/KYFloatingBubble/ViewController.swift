//
//  ViewController.swift
//  KYFloatingBubble
//
//  Created by Kitten Yang on 5/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bubble_blue: UIButton!
    @IBOutlet var bubble_red: UIButton!
    @IBOutlet var bubble_yellow: UIButton!
    @IBOutlet var bubble_orange: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let bubbles = [self.bubble_blue,self.bubble_red,self.bubble_yellow,self.bubble_orange]
        
        for bt in bubbles{
            var pathAnimation = CAKeyframeAnimation(keyPath: "position")
            pathAnimation.calculationMode = kCAAnimationPaced
            pathAnimation.fillMode = kCAFillModeForwards
            pathAnimation.removedOnCompletion = false
            pathAnimation.repeatCount = Float.infinity
            pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            if (bt == self.bubble_yellow) {
                pathAnimation.duration = 5.0
            }else if (bt == self.bubble_orange){
                pathAnimation.duration = 6.0
            }else if (bt == self.bubble_red){
                pathAnimation.duration = 7.0
            }else if (bt == self.bubble_blue){
                pathAnimation.duration = 8.0
            }
            
            
            var curvedPath = CGPathCreateMutable()
            let circleContainer = CGRectInset(bt.frame, bt.frame.size.width/2-3, bt.frame.size.width/2-3)
            CGPathAddEllipseInRect(curvedPath, nil, circleContainer)

            
            pathAnimation.path = curvedPath
            bt.layer.addAnimation(pathAnimation, forKey: "myCircleAnimation")
            
            
            var scaleX = CAKeyframeAnimation(keyPath: "transform.scale.x")
            scaleX.duration = 3
            scaleX.values = [1.0, 1.05, 1.0]
            scaleX.keyTimes = [0.0, 0.5, 1.0]
            scaleX.repeatCount = Float.infinity
            scaleX.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            if (bt == self.bubble_yellow) {
                scaleX.duration = 3
            }else if (bt == self.bubble_orange){
                scaleX.duration = 4
            }else if (bt == self.bubble_red){
                scaleX.duration = 6
            }else if (bt == self.bubble_blue){
                scaleX.duration = 5
            }
            bt.layer.addAnimation(pathAnimation, forKey: "scaleXAnimation")
            
            
            var scaleY = CAKeyframeAnimation(keyPath: "transform.scale.y")
            scaleY.duration = 4
            scaleY.values = [1.0, 1.05, 1.0]
            scaleY.keyTimes = [0.0, 0.5,1.0]
            scaleY.repeatCount = Float.infinity
            scaleY.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            if (bt == self.bubble_yellow) {
                scaleY.duration = 4
            }else if (bt == self.bubble_orange){
                scaleY.duration = 2
            }else if (bt == self.bubble_red){
                scaleY.duration = 3
            }else if (bt == self.bubble_blue){
                scaleY.duration = 5
            }
            bt.layer.addAnimation(pathAnimation, forKey: "scaleYAnimation")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

