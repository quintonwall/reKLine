//
//  AppDefaults.swift
//  dreamhousenative
//
//  Created by Quinton Wall on 7/21/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation
import UIKit



class AppDefaults {
    
    //color palette
    static let klmChocolate: UIColor = UIColor(netHex: 0x615144)
    static let klmGreyBlue: UIColor = UIColor(netHex: 0x4A7AA8)
    static let klmGrey: UIColor = UIColor(netHex: 0x98969E)
    static let klmCreme: UIColor = UIColor(netHex: 0xD7D0C22)
    static let klmBlue: UIColor = UIColor(netHex: 0x109FF3)
    
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
        
        return options
    }
    
}