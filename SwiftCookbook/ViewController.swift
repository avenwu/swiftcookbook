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

    @IBAction func displayerPopover(sender:UIBarButtonItem) {
        popoverController.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any, animated: true)
    }
    
}
