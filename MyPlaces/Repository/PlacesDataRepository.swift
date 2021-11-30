//
//  PlacesMockDataRepository.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation

class PlacesDataRepository: PlacesRepository {
    var places: [Place]
    var searchProvider: YandexSearchProvider
    
    weak var delegate: PlacesRepositoryDelegate?
    
    static var shared: PlacesDataRepository = {
        let instance = PlacesDataRepository()
        return instance;
    }()
    
    private init() {
        places = [Place]()
        searchProvider = YandexSearchProvider()
    }
    
    func getCachedPlaces() -> [Place] {
        return places
    }
    
    func addPlaceToCache(place: Place) {
        places.insert(place, at: 0)
        delegate?.placeAdded(newPlace: place)
    }
    
    func removePlaceFromCache(placeId: Int) {
        places.removeAll(where: {$0.id == placeId})
        delegate?.placeRemoved(removedPlaceId: placeId)
    }
    
    func searchPlaces(with pattern: String, completionHandler: @escaping ([Place]?) -> Void){
        searchProvider.querySearch(with: pattern, completionHandler: { (result) in
            completionHandler(result?.toModel())
        })
    }
}
