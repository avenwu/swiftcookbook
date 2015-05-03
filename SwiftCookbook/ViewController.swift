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
    var button: UIButton!
    var controller: UIAlertController?
    var switcher: UISwitch?
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        addUISwitch()
    }
    
    @IBAction func onManualSegueTouchDown(sender: AnyObject) {
            self.performSegueWithIdentifier("manualSegue", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var identifier = segue.identifier
        if identifier == "manualSegue" {
            var destVc = (segue.destinationViewController as! PresentedViewController)
            destVc.data = "some value from presenting vc \(identifier)"
        }
    }
    override func viewDidAppear(animated: Bool) {
//        addActionSheet()
    }

    func addUISwitch() {
        switcher = UISwitch(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
        view.addSubview(switcher!)
        switcher?.addTarget(self, action: "onSwitchChanged:", forControlEvents: .ValueChanged)
        switcher?.onTintColor = UIColor.redColor()
        switcher?.tintColor = UIColor.brownColor()
        switcher?.thumbTintColor = UIColor.grayColor()
    }
    func onSwitchChanged(sender : UISwitch){
        if sender.on {
            println("Swich is on")
        } else {
            println("Switch is on")
        }
    }
    func addAlert() {
        controller = UIAlertController(title: "Title Fuck", message: "Bitch", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(paramAction:UIAlertAction!) in print("Finished!")
        })
        controller!.addAction(action);
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
    func addActionSheet() {
        controller = UIAlertController(title: "Title Fuck", message: "Bitch", preferredStyle: UIAlertControllerStyle.ActionSheet)
        // necessary for regular
        controller!.popoverPresentationController?.sourceView = view
        controller!.popoverPresentationController?.sourceRect = button.frame
        //        controller!.presentationController?.containerView = view
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {(paramAction:UIAlertAction!) in print("Finished!")
        })

        let actionEmail = UIAlertAction(title: "Via email", style: UIAlertActionStyle.Default,
            handler: {(paramAction:UIAlertAction!) in
                /* Send the photo via email */
        })
        let actionImessage = UIAlertAction(title: "Via iMessage", style: UIAlertActionStyle.Default,
            handler: {(paramAction:UIAlertAction!) in
                /* Send the photo via iMessage */
        })
        let actionDelete = UIAlertAction(title: "Delete photo", style: UIAlertActionStyle.Destructive,
            handler: {(paramAction:UIAlertAction!) in
                /* Delete the photo here */
        })
        controller!.addAction(actionEmail)
        controller!.addAction(actionImessage)
        controller!.addAction(actionDelete)
        self.presentViewController(controller!, animated: true, completion: nil)
    }
    
    func addButton(){
        button = UIButton.buttonWithType(.System) as? UIButton
        button.frame = CGRect(x: 110, y: 70, width: 100, height: 44)
        button.setTitle("Press Me", forState: .Normal)
        button.setTitle("I'm Pressed", forState: .Highlighted)
        button.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        button.addTarget(self, action: "buttonIsPressed:", forControlEvents: .TouchDown)
        button.addTarget(self, action: "buttonIsPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }
    func buttonIsPressed(sender: UIButton) {
        print("Click button")
//        addAlert()
        addActionSheet()
    }
    
    /**
    * add blur effect to imageview
    */
    func addBlurEffect() {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blurView.frame.size = CGSize(width: 300, height: 300)
        blurView.center = view.center
        view.addSubview(blurView)
    }
    
    /**
    * add simple UILabel with multiline text
    */
    func addNormalLabel() {
        label = UILabel(frame: CGRect(x: 20, y: 100, width: 100, height: 70))
        label.text = "iOS Programming Cookbook"
        label.font = UIFont.boldSystemFontOfSize(14)
        //set 0 means multilines
        label.numberOfLines = 0
        // auto resize the text
        label.adjustsFontSizeToFitWidth = true
    }
    
    /**
    * add UILabel with two different attributes of string
    */
    func addLabelWithAttribute() {
        label = UILabel()
        label.attributedText = attributedText()
        label.center = CGPoint(x: 80, y: 400)
        label.sizeToFit()
        view.addSubview(label)
    }
    
    func attributedText() -> NSAttributedString {
        let attributedString = "Hello Swift" as NSString
        let result = NSMutableAttributedString(string: attributedString as String)
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
