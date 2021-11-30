//
//  SearchPlaceTableViewCell.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation
import UIKit

class SearchPlaceTableViewCell: UITableViewCell{
    
    @IBOutlet weak var addressLabel: UILabel!
    
    static let key = "SearchPlaceTableViewCell"
    
    func update(from place: Place){
        addressLabel.text = place.name
    }
}
