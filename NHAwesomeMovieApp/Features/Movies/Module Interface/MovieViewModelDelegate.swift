//
//  NowPlayingViewModelDelegate.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

protocol MovieViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}
