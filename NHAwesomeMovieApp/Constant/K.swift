//
//  K.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

enum MoviesEndPoint: String {
    case getnowPlaying  = "movie/popular"
    case getTopRates = "movie/top_rated"
}

struct K {
    
    private struct Domains {
        static let Dev = "https://api.themoviedb.org"
        static let UAT = "https://image.tmdb.org"
        static let Local = "192.145.1.1"
        static let QA = "themoviedb.qa.com"
    }
    
    private  struct Routes {
        static let Api = "/3"
        static let ApiImage = "/t/p"
    }
    
    private  static let Domain = Domains.Dev
    private  static let DomainIamage = Domains.UAT
    private  static let Route = Routes.Api
    private  static let imageRoute = Routes.ApiImage
    private  static let BaseURL = Domain + Route
    private  static let BaseURLImage = DomainIamage + imageRoute
    
    static var FacebookLogin: String {
        return BaseURL  + ""
    }
    //https://api.themoviedb.org/t/p/w45/8moTOzunF7p40oR5XhlDvJckOSW.jpg
    //https://image.tmdb.org/t/p/w45/zfE0R94v1E8cuKAerbskfD3VfUt.jpg
    enum SmallImageDownload {
        case endpath(withName: String)
        var path: String {
            switch self {
            case let .endpath(withName):
                return BaseURLImage +  "/w45/" + withName
            }
        }
    }
    
    enum PosterImageDownload {
        case endpath(withName: String)
        var path: String {
            switch self {
            case let .endpath(withName):
                return BaseURLImage +  "/original/" + withName
            }
        }
    }
    
    //https://api.themoviedb.org/3/movie/now_playing?api_key=26bd27c2f63ddd742d5bcdfe5129f5d0&page=1
    enum APIEndpoints {
        case getNowPlaying(pageNaem : String,page:Int,key: String)
        var path: String {
            switch self {
            case let .getNowPlaying(pageName,page,key):
                return BaseURL  + "/\(pageName)?api_key=\(key)&page=\(page)"
            }
        }
    }
}
