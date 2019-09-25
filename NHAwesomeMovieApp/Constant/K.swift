//
//  K.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

struct K {
    
    private struct Domains {
        static let Dev = "https://api.themoviedb.org"
        static let UAT = "https://api.themoviedb.org"
        static let Local = "192.145.1.1"
        static let QA = "themoviedb.qa.com"
    }
    
    private  struct Routes {
        static let Api = "/3"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    static var FacebookLogin: String {
        return BaseURL  + ""
    }
    
    
    enum ImageDownload {
        case endpath(withName: String)
        var path: String {
            switch self {
            case let .endpath(withName):
                return Domain +  "/" + withName
            }
        }
    }
    
    //https://api.themoviedb.org/3/movie/now_playing?api_key=26bd27c2f63ddd742d5bcdfe5129f5d0&page=1
    enum APIEndpoints {
        case getNowPlaying(page:Int,key: String)
        var path: String {
            switch self {
            case let .getNowPlaying(page,key):
                return BaseURL  + "/movie/now_playing?api_key=\(key)&page=\(page)"
            }
        }
    }
}
