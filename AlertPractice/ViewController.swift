//
//  ViewController.swift
//  AlertPractice
//
//  Created by Allen Spicer on 6/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor()
        super.viewDidLoad()

        // first set up an object to animate
        // we'll use a familiar red square
        let square = UIView()
        square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
        square.backgroundColor = UIColor.redColor()
        
        // add the square to the screen
        self.view.addSubview(square)
        
        // now create a bezier path that defines our curve
        // the animation function needs the curve defined as a CGPath
        // but these are more difficult to work with, so instead
        // we'll create a UIBezierPath, and then create a
        // CGPath from the bezier when we need it
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 239))
        path.addCurveToPoint(CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        // we add the animation to the squares 'layer' property
        square.layer.addAnimation(anim, forKey: "animate position along path")

    }
    

    @IBAction func AlertMe(sender: AnyObject) {
        alertMaker()
    }

    func alertMaker(){
        let alertController = UIAlertController(title: "Default Style", message: "A standard alert.", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.alertMaker()
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }

    
    }
    
    
}

