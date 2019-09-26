//
//  NowPlayingDate.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 24/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation


struct MovieDate : Codable {
    
    let maximum : String?
    let minimum : String?
    
    
    enum CodingKeys: String, CodingKey {
        case maximum = "maximum"
        case minimum = "minimum"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maximum = try values.decodeIfPresent(String.self, forKey: .maximum)
        minimum = try values.decodeIfPresent(String.self, forKey: .minimum)
    }
    
}
