//
//  TopRatedViewController.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import UIKit

class TopRatedViewController : MovieViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        LLSpinner.spin()
        viewModel = MovieViewModel(pageName: MoviesEndPoint.getTopRates.rawValue, delegate: self)
        viewModel.fetchMovies()
    }
}


