
//
//  NHClient.swift
//  NHiOSBoilerplateTemplate
//
//  Created by Nazmul on 23/12/18.
//  Copyright © 2018 Nazmulcsharp. All rights reserved.
//
//##########################################################################
//Warring don't republish API code without Md Nazmul Hasan permision beacuse of this code owner Md Nazmul Hasan.
//if you need any kind of concern contact with mail nazmulcsharp@gmail.com
//##########################################################################


import Foundation

enum DataResponseError: Error {
    case network
    case decoding
    
    var reason: String {
        switch self {
        case .network:
            return "An error occurred while fetching data"
        case .decoding:
            return "An error occurred while decoding data"
        }
    }
}


extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}

enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}

protocol NHDataProvider {
    func fetchRemote<Model: Codable>(_ val: Model.Type, url: URL, completion: @escaping (Result<Codable, DataResponseError>) -> Void)
}

final class NHClientHTTPNetworking : NHDataProvider {
   
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchRemote<Model: Codable>(_ val: Model.Type, url: URL,
                         completion: @escaping (Result<Codable, DataResponseError>) -> Void) {
        // 1
        let urlRequest = URLRequest(url: url)
        // 2

        session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            // 3
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
                else {
                    completion(Result.failure(DataResponseError.network))
                    return
            }
            
            // 4
            guard let decodedResponse = try? JSONDecoder().decode(NowPlayingList.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            
            // 5
            completion(Result.success(decodedResponse))
        }).resume()
    }
}
