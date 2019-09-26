//
//  RootClass.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 23/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

struct MovieList : Codable {
    
    let dates : MovieDate?
    let page : Int?
    let results : [Movie]?
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
        dates = try MovieDate(from: decoder)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([Movie].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
    
    
}

