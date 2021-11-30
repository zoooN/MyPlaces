//
//  RepositoryManager.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation

protocol PlacesRepository {
    var delegate: PlacesRepositoryDelegate? { get set }
    
    func getCachedPlaces() -> [Place]
    func addPlaceToCache(place: Place) -> Void
    func removePlaceFromCache(placeId: Int) -> Void
    
    func searchPlaces(with pattern: String, completionHandler: @escaping ([Place]?) -> Void)
}
