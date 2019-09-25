//
//  TabBarItemController.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//


import Foundation
import UIKit

struct TabBarItemController {
    
    let controller: UIViewController
    let imageEnbled: String
    let imageDisabled: String
    private let controllerName: String
    
    
    init(itemType: TabBarItems) {
        switch itemType {
        case .NowShowing:
            self.controllerName = AppConstants.TabBarItems.Movies.name
            self.controller = NowPlayingViewController()
            self.imageEnbled = AppConstants.TabBarItems.Movies.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.Movies.imageDisabled
        case .TopMovie:
            self.controllerName = AppConstants.TabBarItems.TvShows.name
            self.controller = TopRatedViewController()
            self.imageEnbled = AppConstants.TabBarItems.TvShows.imageEnbled
            self.imageDisabled = AppConstants.TabBarItems.TvShows.imageDisabled
        }
    }
}
