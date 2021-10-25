//
//  RepositoryManager.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation

protocol PlacesRepository {
    func GetPlaces() -> [Place]
    func AddPlace(place: Place) -> Void
    func RemovePlace(placeId: Int) -> Void
}
