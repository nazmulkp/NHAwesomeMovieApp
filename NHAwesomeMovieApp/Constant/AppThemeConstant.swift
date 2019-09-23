//
//  AppThemeConstant.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 23/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import UIKit
import MessageUI

enum Theme: Int {
    case `default`, NightMode
    
    enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    static var current: Theme {
        return  AppSettings.shared.keepNightMood() ? .NightMode :  .default 
    }
    

    //Mark:- Main View
    var backgroundColor: UIColor {
        switch self {
        case .default :   return Color.WhiteGray
        case .NightMode:      return Color.NightRider
        }
    }

    //MARK:- text

        var mainFontColor: UIColor {
            switch self {
            case .default : return  Color.Charcoal
            case .NightMode : return Color.WhiteSmoke //0x6F6F6F
            }
        }

    var subFontColor: UIColor {
        switch self {
        case .default :   return Color.NavyBlueLight
        case .NightMode:  return Color.NavyBlue
        }
    }

    var buttonColor: UIColor {
        switch self {
        case .default:  return Color.green
        case .NightMode: return Color.lightGray
        }
    }

    
    
    func apply() {
     
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
        
        }
}

