//
//  TopRated.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 24/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

struct TopRatedRootClass : Codable {
    
    let page : Int?
    let results : [TopRatedResult]?
    let totalPages : Int?
    let totalResults : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([TopRatedResult].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
    
}
