//
//  ViewController.swift
//  SwiftCookbook
//
//  Created by aven wu on 4/7/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blurView.frame.size = CGSize(width: 300, height: 300)
        blurView.center = view.center
        view.addSubview(blurView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

