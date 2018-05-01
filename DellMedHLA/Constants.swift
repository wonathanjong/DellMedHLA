//
//  Constants.swift
//  DellMedHLA
//
//  Created by Jonathan Wong  on 4/28/18.
//  Copyright © 2018 Jonathan Wong . All rights reserved.
//

import Foundation
import CoreLocation
import Eureka
import PureLayout

struct Constants {
    
    struct Config {
       static var SKSAppKey = "37df811a6128c544c18fdbe234d5da1af25ba67adfa5737768ca00953f83da76625c90c384550745e5e32819b80234aa5eda243d7f98b4e762b47ca137561799"
       static var SKSAppId = "NMDPTRIAL_jonathanwong_utexas_edu20180430221541"
       static var SKSServerHost = "sslsandbox-nmdp.nuancemobility.net"
       static var SKSServerPort = "443"
        
       static var SKSServerUrl = String(format: "nmsps://NMDPTRIAL_jonathanwong_utexas_edu20180430221541@sslsandbox-nmdp.nuancemobility.net:443", SKSAppId, SKSServerHost, SKSServerPort)
        
        static var SKSLanguage = "!LANGUAGE!"
        static let LANGUAGE = SKSLanguage == "!LANGUAGE!" ? "eng-USA" : SKSLanguage
    }
    
    struct Color {
       
    }
    
    struct Notification {
    }
    
    struct Location {
        static var currentLocation: CLLocation?
    }
    
    struct Screen {
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
        static let bounds = UIScreen.main.bounds
    }
}

typealias Emoji = String
let 👦🏼 = "👦🏼", 🍐 = "🍐", 💁🏻 = "💁🏻", 🐗 = "🐗", 🐼 = "🐼", 🐻 = "🐻", 🐖 = "🐖", 🐡 = "🐡"

extension Dictionary where Key == String {
    
    subscript(caseInsensitive key: Key) -> Value? {
        get {
            if let k = keys.first(where: { $0.caseInsensitiveCompare(key) == .orderedSame }) {
                return self[k]
            }
            return nil
        }
        set {
            if let k = keys.first(where: { $0.caseInsensitiveCompare(key) == .orderedSame }) {
                self[k] = newValue
            } else {
                self[key] = newValue
            }
        }
    }
    
}

extension Dictionary where Key: ExpressibleByStringLiteral {
    mutating func lowercaseKeys() {
        for key in self.keys {
             self[String(describing: key).lowercased() as! Key] = self.removeValue(forKey: key)
        }
    }
}

