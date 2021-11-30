//
//  NetworkFetcher.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation

enum NetworkError : Error {
  case DataEmptyError
}

class NetworkFetcher {
  
  lazy var session: Sessionable = URLSession.shared

  func get(forUrl url: String, completion: @escaping (Data?, Error?) -> Void) {
    
    guard let url = URL(string: url) else {
      fatalError()
    }
    
    session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(nil, error)
        return
      }
      
      guard let data = data else {
        completion(nil, NetworkError.DataEmptyError)
        return
      }
      
      completion(data, nil)

    }.resume()
  }
}

extension URLSession: Sessionable { }

protocol Sessionable {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
