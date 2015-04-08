//
//  File.swift
//  SwiftCookbook
//
//  Created by aven wu on 4/7/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//
import UIKit
extension Array {
    subscript(path: NSIndexPath) -> T {
        return self[path.row]
    }
}
extension NSIndexPath {
    class func firstIndexPath() -> NSIndexPath {
        return NSIndexPath(forRow: 0, inSection: 0)
    }
}
class PopoverTableViewController: UITableViewController {
    struct TableViewValues {
        static let identifier = "Cell"
    }
    lazy var items: [String] = {
        var returnValue = [String]()
        for counter in 1...100 {
            returnValue.append("Item \(counter)")
        }
        return returnValue
        }()
    
    var cancelBarButtonItem: UIBarButtonItem!
    var selectionHandler: ((selectedItem: String) -> Void!)?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: TableViewValues.identifier)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "performCancel")
        navigationItem.leftBarButtonItem = cancelBarButtonItem
    }
    
    func performCancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = items[indexPath]
        selectionHandler?(selectedItem: selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        preferredContentSize = CGSize(width: 300, height: 200)
    }
    
    override func tableView (tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewValues.identifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = items[indexPath]
        return cell
    }
}