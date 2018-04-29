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

