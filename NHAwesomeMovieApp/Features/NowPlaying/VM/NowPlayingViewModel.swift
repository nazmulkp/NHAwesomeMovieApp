//
//  NowPlayingViewModel.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//


import Foundation

final class NowPlayingViewModel {
    private weak var delegate: NowPlayingViewModelDelegate?
    
    private var nowPlaying: [NowPlaying] = []
    private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    
    var client : NHDataProvider!
    init( client : NHDataProvider = NHClientHTTPNetworking(), delegate: NowPlayingViewModelDelegate) {
        self.client = client
        self.delegate = delegate
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return nowPlaying.count
    }
    
    func nowPlaying(at index: Int) -> NowPlaying {
        return nowPlaying[index]
    }
    
    func fetchNowPlaying() {
        // 1
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        // 2
        let url = URL(string:K.APIEndpoints.getNowPlaying(page: 1, key: tokenClosure()).path )!
        print(url)
        client.fetchRemote(NowPlayingList.self, url: url) { result in
            switch result {
            // 3
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error.reason)
                }
            // 4
            case .success(let response):
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    if let response = response as? NowPlayingList {
                        if let result =  response.results {
                            self.nowPlaying.append(contentsOf: result)
                        }
                    }
                    self.delegate?.onFetchCompleted(with: .none)
                }
            }
        }
    }
}
