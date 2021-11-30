//
//  PlaceTableViewCell.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import Foundation
import UIKit

class PlaceTableViewCell: UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let key = "PlaceTableViewCell"
    
    func update(from place: Place){
        titleLabel.text = place.name
    }
}
