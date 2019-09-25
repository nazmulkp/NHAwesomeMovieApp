//
//  File.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 26/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

import Foundation

let tokenClosure: () -> String = {
    AuthHelper.Auth().token
}

class AuthHelper {
    class func Auth() -> (isValidIn: Bool, token: String) {
        return (isValidIn: true, token: "26bd27c2f63ddd742d5bcdfe5129f5d0")
    }
    
    //below going to implement token expire
}
