//
//  AppDefaults.swift
//  dreamhousenative
//
//  Created by Quinton Wall on 7/21/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation
import UIKit

let KEY_VIEWED_WELCOME_TOUR : String = "rekline-show-welcome-tour"

class AppDefaults {
    
    //color palette
    static let klmChocolate: UIColor = UIColor(netHex: 0x615144)
    static let klmGreyBlue: UIColor = UIColor(netHex: 0x4A7AA8)
    static let klmGrey: UIColor = UIColor(netHex: 0x98969E)
    static let klmCreme: UIColor = UIColor(netHex: 0xD7D0C22)
    static let klmBlue: UIColor = UIColor(netHex: 0x109FF3)
    
    
    static func hasViewedWelcomeTour() -> Bool {
    
        let defaults = NSUserDefaults.standardUserDefaults()
    
        if (defaults.objectForKey(KEY_VIEWED_WELCOME_TOUR) == nil) {
            AppDefaults.didViewWelcomeTour(false)
        }
        
        return defaults.boolForKey(KEY_VIEWED_WELCOME_TOUR)

    }
    
    static func didViewWelcomeTour(viewTour: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(viewTour, forKey: KEY_VIEWED_WELCOME_TOUR)
    }
    
    /*
    static func isLoggedIn() -> Bool {
        return SFAuthenticationManager.sharedManager().haveValidSession
    }
    
    static func getUserId() -> String {
        return SFUserAccountManager.sharedInstance().currentUser!.accountIdentity.userId
    }
    
    */
    
    static func getSOSOptions() -> SOSOptions {
        let options = SOSOptions(liveAgentPod: "d.la4-c1-was.salesforceliveagent.com",
                                 orgId: "00D36000000kFKB",
                                 deploymentId: "0NW36000000Gmxc")
        
       
        options.featureClientFrontCameraEnabled = true
        options.featureClientBackCameraEnabled = true
        options.initialCameraType = SOSCameraType.FrontFacing
        options.featureClientScreenSharingEnabled = true
        
        return options
    }
    
}