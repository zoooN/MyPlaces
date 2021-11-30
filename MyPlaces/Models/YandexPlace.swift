//
//  YandexPlace.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation

struct YandexPlace: Codable {
    let type: String
    let properties: YandexPlaceProperties
    let features: [Feature]
}

struct YandexPlaceProperties: Codable {
    let responseMetaData: ResponseMetaData

    enum CodingKeys: String, CodingKey {
        case responseMetaData = "ResponseMetaData"
    }
}

struct ResponseMetaData: Codable {
    let searchRequest: SearchRequest
    let searchResponse: SearchResponse

    enum CodingKeys: String, CodingKey {
        case searchRequest = "SearchRequest"
        case searchResponse = "SearchResponse"
    }
}

struct SearchRequest: Codable {
    let request: String
    let results, skip: Int
    let boundedBy: [[Double]]
}

struct SearchResponse: Codable {
    let found: Int
    let boundedBy: [[Double]]
    let display: String

    enum CodingKeys: String, CodingKey {
        case found
        case boundedBy, display
    }
}

struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct Feature: Codable {
    let type: String
    let properties: FeatureProperties
    let geometry: Geometry
}

struct FeatureProperties: Codable {
    let geocoderMetaData: GeocoderMetaData
    let propertiesDescription, name: String
    let boundedBy: [[Double]]

    enum CodingKeys: String, CodingKey {
        case geocoderMetaData = "GeocoderMetaData"
        case propertiesDescription = "description"
        case name, boundedBy
    }
}

struct GeocoderMetaData: Codable {
    let kind, text, precision: String
}

extension YandexPlace{
    func toModel() -> [Place]? {
        return self.features.map { feature in
            Place(id: feature.properties.name.hashValue,
                  name: feature.properties.name,
                  address: feature.properties.propertiesDescription,
                  location: Location(lat: feature.geometry.coordinates[0], lng: feature.geometry.coordinates[1]))
        }
    }
}
