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

