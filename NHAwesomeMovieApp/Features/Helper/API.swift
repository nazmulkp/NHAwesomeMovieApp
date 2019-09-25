//
//  API.swift
//  NHAwesomeMovieApp
//
//  Created by Nazmul on 25/9/19.
//  Copyright © 2019 Nazmul Hasan. All rights reserved.
//

//##########################################################################
//Warring don't republish API code without Md Nazmul Hasan permision beacuse of this code owner Md Nazmul Hasan.
//if you need any kind of concern contact with mail nazmulcsharp@gmail.com
//##########################################################################



import Foundation

protocol Mockable {
    static func data(for url: URL) -> Codable
}
enum HTTPMethod: String {
    case get = "GET", post = "POST"
}

struct API {
    enum APIError: Error {
        case httpResponse, parse(Error)
    }
    
    enum APIMode {
        case normal, mock
    }
    
    static let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        return session
    }()
    
    struct Request {
        private let task: URLSessionDataTask
        private var mockObject: Mockable.Type? = nil
        private var url: URL
        private let completion: (_ data: Codable?)->()
        
        #if DEBUG
        private var isMocked = false
        #endif
        
        init(task: URLSessionDataTask, url: URL, completion: @escaping (_ data: Codable?)->()) {
            self.task = task
            self.url = url
            self.completion = completion
        }
        
        private init(task: URLSessionDataTask, url: URL, isMocked: Bool, mockObject: Mockable.Type, completion: @escaping (_ data: Codable?)->()) {
            self.task = task
            self.url = url
            self.completion = completion
            self.isMocked = isMocked
            self.mockObject = mockObject
        }
        
        #if DEBUG
        func start() {
            if isMocked {
                completion(mockObject?.data(for: url))
            } else {
                task.resume()
            }
        }
        func useMock(object: Mockable.Type) -> Request {
            return Request(task: task, url: url, isMocked: true, mockObject: object, completion: completion)
        }
        #else
        func start() {
            task.resume()
        }
        #endif
    }
    
    
    static var mode: APIMode = .normal
    
    static func getRequest<Model: Codable>(_ val: Model.Type, url: URL, completion: @escaping (_ data: Codable?)->()) -> Request {
        let request = URLRequest(.get, url: url)
        let task = session.dataTask(with: request) { (data, response , error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil)
                    print("Error Deatails:"+response.debugDescription)
                    print("Error code:"+error.debugDescription)
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(val.self, from: data)
                    completion(model)
                    
                }catch {
                    print("parsing goes to wrong....")
                }
                
                
            }
        }
        return Request(task: task, url: url, completion: completion)
    }
    
    @discardableResult
    static func getData(from url: URL, completion: @escaping (_ data: Data?)->()) -> URLSessionDataTask {
        let request = URLRequest(.get, url: url)
        
        let sessionTask = session.dataTask(with: request) { (data, _, _) in
            DispatchQueue.main.async {
                completion(data)
            }
        }
        sessionTask.resume()
        return sessionTask
    }
}




extension URLRequest {
    init(_ method: HTTPMethod,  url: URL) {
        self.init(url: url)
        self.httpMethod = method.rawValue
    }
}

//=================================

