//
//  YandexSearchProvider.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation

class YandexSearchProvider: SearchProvider{
    typealias SearchResult = YandexPlace
    
    private let rootUrl = "https://search-maps.yandex.ru/v1/"
    private let apiKey = "70041f91-1989-435a-ac6e-f3bfb12f52bd";
    
    var network: NetworkFetcher!
    
    init(){
        network = NetworkFetcher()
    }
    
    func querySearch(with pattern: String, completionHandler: @escaping (YandexPlace?) -> Void) {
        let url = "\(rootUrl)?apikey=\(apiKey)&text=\(pattern)&type=geo&lang=en_RU"
        
        network.get(forUrl: url, completion: { (data, error) in
            if error != nil {
                completionHandler(nil)
                return
            }
            
            guard let data = data else{
                completionHandler(nil)
                return
            }
            
            let yandexPlace = try? JSONDecoder().decode(YandexPlace.self, from: data)
            completionHandler(yandexPlace)
        })
    }
}
