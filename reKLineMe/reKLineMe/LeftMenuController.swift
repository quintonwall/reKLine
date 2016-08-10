//
//  LeftMenuController.swift
//  dreamhousenative
//
//  Created by QUINTON WALL on 7/26/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import UIKit


class LeftMenuController: UITableViewController {

    let kInset:CGFloat = 64.0
    var selectedMenuItem : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.contentInset = UIEdgeInsetsMake(kInset, 0, 0, 0)
        }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("SELECTED INDEX: \(indexPath.row)")
       
        /*if (indexPath.row == selectedMenuItem) {
            return
        }*/
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        
        switch (indexPath.section) {
        case 0: // seating section
            switch (indexPath.row) {
            case 0:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WelcomeView")
                break
            case 1:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SelectSeatingView")
                break
            case 2:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            case 3:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            default:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            }
        case 1: //account section
            switch (indexPath.row) {
            case 0:
                 destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            case 1:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            case 2:
                 destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("NotImplementedView")
                break
            default:
                destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WelcomeView")
                break
            }
        default: //you're screwed section
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("WelcomeView")
            break
        }
         sideMenuController()?.setContentViewController(destViewController)
        
        
    }


}
