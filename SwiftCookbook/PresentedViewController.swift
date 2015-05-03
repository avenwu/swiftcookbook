//
//  PresentedViewController.swift
//  SwiftCookbook
//
//  Created by aven wu on 5/3/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//

import UIKit
class PresentedViewController: UIViewController {
    var data: String?
    
    override func viewDidLoad() {
        if let tmp = data {
            println("received data: \(tmp)")
        }
    
    }
    @IBAction func backPrevious(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }
}
