//
//  ViewController.swift
//  SwiftCookbook
//
//  Created by aven wu on 4/7/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var selectedItem: String?
    lazy var popoverContentController: UINavigationController = {
        let controller = PopoverTableViewController(style: .Plain)
        controller.selectionHandler = self.selectionHandler
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }()
    
    lazy var popoverController: UIPopoverController = {
        return UIPopoverController(contentViewController: self.popoverContentController)
    }()
    
    func selectionHandler(selectedItem: String) {
        self.selectedItem = selectedItem
    }
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // add blur effect to imageview
        /*let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))

        blurView.frame.size = CGSize(width: 300, height: 300)
        blurView.center = view.center
        view.addSubview(blurView)*/
        label = UILabel(frame: CGRect(x: 20, y: 100, width: 100, height: 23))
        label.text = "iOS Programming Cookbook"
        label.font = UIFont.boldSystemFontOfSize(14)
        view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func displayerPopover(sender:UIBarButtonItem) {
        popoverController.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any, animated: true)
    }
    
}
