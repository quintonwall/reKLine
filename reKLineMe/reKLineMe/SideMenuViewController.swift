//
//  SideMenuViewController.swift
//  dreamhousenative
//
//  Created by QUINTON WALL on 7/26/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

import Spring


class SideMenuViewController: UIViewController, ENSideMenuDelegate {
    
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       bgImage.blurImageLightly()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
       // print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        //print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        //print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
       // print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
       // print("sideMenuDidOpen")
    }
}

