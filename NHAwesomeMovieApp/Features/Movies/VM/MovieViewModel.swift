//
//  NowPlayingViewModel.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//


import Foundation

final class MovieViewModel {
    private weak var delegate: MovieViewModelDelegate?
    
    private var movies: [Movie] = []
    private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    
    var client : NHDataProvider!
    var pageName : String!
    init( pageName: String, client : NHDataProvider = NHClientHTTPNetworking(), delegate: MovieViewModelDelegate) {
        self.pageName = pageName
        self.client = client
        self.delegate = delegate
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func fetchMovies() {
        // 1
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        // 2
        let url = URL(string:K.APIEndpoints.getNowPlaying(pageNaem: pageName, page: currentPage, key: tokenClosure()).path )!
        print(url)
        client.fetchRemote(MovieList.self, url: url) { result in
            switch result {
            // 3
            case .failure(let error):
                DispatchQueue.main.async { [unowned self] in
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
            // 4
            case .success(let response):
                DispatchQueue.main.async { [unowned self] in
                    // 1
                    self.currentPage += 1
                    self.isFetchInProgress = false
                    // 2
                    
                    if let response = response as? MovieList {
                        self.total = response.totalResults ?? 0
                        if let results =  response.results {
                            self.movies.append(contentsOf: results)
                        }
                        if response.page ?? 0 > 1 {
                            if let results =  response.results {
                                let indexPathsToReload = self.calculateIndexPathsToReload(from: results)
                                self.delegate?.onFetchCompleted(with: indexPathsToReload)
                            }
                        } else {
                            self.delegate?.onFetchCompleted(with: .none)
                        }
                    }
                    
                }
            }
        }
        
    }
    
    private func calculateIndexPathsToReload(from newModerators: [Movie]) -> [IndexPath] {
        let startIndex = movies.count - newModerators.count
        let endIndex = startIndex + newModerators.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}




