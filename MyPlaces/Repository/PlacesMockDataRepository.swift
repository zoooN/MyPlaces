//
//  PlacesMockDataRepository.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation

class PlacesMockDataRepository: PlacesRepository {
    
    var mockPlaces: [Place]
    
    init() {
        mockPlaces = PlacesMockDataRepository.GetInitialMockPlaces()
    }
    
    func GetPlaces() -> [Place] {
        return mockPlaces
    }
    
    func AddPlace(place: Place) {
        mockPlaces.append(place)
    }
    
    func RemovePlace(placeId: Int) {
        mockPlaces.removeAll(where: {$0.id == placeId})
    }
    
    private static func GetInitialMockPlaces() -> [Place] {
        return [
            Place(id: 1, name: "Place 1", location: Location(lat: 56, lng: 56)),
            Place(id: 2, name: "Place 2", location: Location(lat: 56, lng: 56)),
            Place(id: 3, name: "Place 3", location: Location(lat: 56, lng: 56)),
        ]
    }
}
