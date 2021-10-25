//
//  ViewController.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 25.10.2021.
//

import UIKit
import MapKit

class PlacesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var chooseViewSegmentedControl: UISegmentedControl!
    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var placesMapView: MKMapView!
    
    let listViewIndex = 0
    let mapViewIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareChooseView()
        prepareTableView()
        prepareMapView()
    }
    
    func prepareChooseView() {
        chooseViewSegmentedControl.addTarget(self, action: #selector(chooseViewIndexChanged(_:)), for: .valueChanged)
        updateViewsVisibility()
    }
    
    func prepareTableView() {
        placesTableView.dataSource = self
    }
    
    func prepareMapView() {
        
    }

    @objc func chooseViewIndexChanged(_ sender: UISegmentedControl) {
        updateViewsVisibility()
    }
    
    func updateViewsVisibility() {
        placesTableView.isHidden = chooseViewSegmentedControl.selectedSegmentIndex != listViewIndex
        placesMapView.isHidden = chooseViewSegmentedControl.selectedSegmentIndex != mapViewIndex
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceTableViewCell.key, for: indexPath) as! PlaceTableViewCell
        cell.updateTitle(title: "Test777")
        
        return cell
    }
}

