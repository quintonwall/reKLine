//
//  String.swift
//  DHNative
//
//  Created by QUINTON WALL on 7/31/16.
//  Copyright © 2016 Quinton Wall. All rights reserved.
//

import Foundation

public extension String {
    public func contains(string: String) -> Bool {
        return rangeOfString(string) != nil
    }
    
    subscript(i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript(i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript(r: Range<Int>) -> String {
        let start = startIndex.advancedBy(r.startIndex)
        let end = start.advancedBy(r.endIndex - r.startIndex)
        return self[start..<end]
    }
}

public extension Optional {
    public func contains(string: String) -> Bool {
        switch self {
        case .None:
            return false
        case let .Some(value):
            if value is Int {
                return "\((value as! Int))".rangeOfString(string) != nil
            } else if value is String {
                return (value as! String).rangeOfString(string) != nil
            }
        }
        
        return false
    }
    
    public func contains(int: Int) -> Bool {
        return contains("\(int)")
    }
}