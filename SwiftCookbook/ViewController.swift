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

        // label = UILabel(frame: CGRect(x: 20, y: 100, width: 100, height: 70))
        label = UILabel()
        label.attributedText = attributedText()
        label.center = CGPoint(x: 80, y: 400)
        label.sizeToFit()
//        label.text = "iOS Programming Cookbook"
//        label.font = UIFont.boldSystemFontOfSize(14)
        //set 0 means multilines
//        label.numberOfLines = 0
        // auto resize the text
//        label.adjustsFontSizeToFitWidth = true
        view.addSubview(label)
        
    }
    func attributedText() -> NSAttributedString {
        let attributedString = "Hello Swift" as NSString
        let result = NSMutableAttributedString(string: attributedString)
        let attributes4FirstWord = [
            NSFontAttributeName : UIFont.boldSystemFontOfSize(60),
            NSForegroundColorAttributeName : UIColor.redColor(),
            NSBackgroundColorAttributeName : UIColor.blueColor()
        ]
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.brownColor()
        shadow.shadowOffset = CGSize(width: 7, height: 7)
        
        let attributes4SecondWord = [
            NSFontAttributeName : UIFont.boldSystemFontOfSize(60),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSBackgroundColorAttributeName : UIColor.redColor(),
            NSShadowAttributeName : shadow
        ]
        result.setAttributes(attributes4FirstWord, range: attributedString.rangeOfString("Hello"))
        result.setAttributes(attributes4SecondWord, range: attributedString.rangeOfString("Swift"))
        return  NSAttributedString(attributedString: result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func displayerPopover(sender:UIBarButtonItem) {
        popoverController.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any, animated: true)
    }
    
}
