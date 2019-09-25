//
//  RootClass.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 23/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

struct NowPlayingList : Codable {
    
    let dates : NowPlayingDate?
    let page : Int?
    let results : [NowPlaying]?
    let totalPages : Int?
    let totalResults : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dates = try NowPlayingDate(from: decoder)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([NowPlaying].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
    
}
