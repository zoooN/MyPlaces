//
//  SearchProvider.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation

protocol SearchProvider{
    associatedtype SearchResult
    func querySearch(with pattern: String, completionHandler: @escaping (SearchResult?) -> Void)
}
