//
//  AppSettings.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 23/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

class AppSettings {
   
    enum Settings: String {
        case nightMood = "NightMood"
        var str: String { return rawValue }
    }

    let defaults = UserDefaults.standard
    
    static let shared: AppSettings = {
        return AppSettings()
    }()
  
    func changeNightMood() {
        let toState = !keepNightMood()
        defaults.set(toState, forKey: Settings.nightMood.str)
        defaults.synchronize()
        
    }
    
    func keepNightMood() -> Bool {
        return defaults.bool(forKey: Settings.nightMood.str)
    }
}
