//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation

class Place {
    
    let id: Int
    let name: String
    let location: Location
    
    init(id: Int, name: String, location: Location) {
        self.id = id
        self.name = name
        self.location = location
    }
}
