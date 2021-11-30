//
//  PlacesRepositoryDelegate.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation

protocol PlacesRepositoryDelegate: AnyObject{
    func placeAdded(newPlace: Place)
    func placeRemoved(removedPlaceId: Int)
}
