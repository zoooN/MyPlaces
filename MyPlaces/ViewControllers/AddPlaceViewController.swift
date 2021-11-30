//
//  AddPlaceViewController.swift
//  MyPlaces
//
//  Created by Andrey Philippov on 18.11.2021.
//

import Foundation
import UIKit

class AddPlaceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    var placeSelected: Bool = false
    var foundPlaces: [Place]?
    
    var placesRepository: PlacesRepository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesRepository = PlacesDataRepository.shared
        
        prepareAddButton()
        prepareSearchResultsTableView()
    }
    
    func prepareAddButton(){
        addButton.isEnabled = false
    }
    
    func prepareSearchResultsTableView(){
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        searchResultsTableView.clipsToBounds = true
        searchResultsTableView.layer.cornerRadius = 5
        searchResultsTableView.isHidden = true
    }
    
    func updateAddButton(){
        addButton.isEnabled = nameField.text != nil && placeSelected
    }
    
    @IBAction func nameEditingChanged(_ sender: Any) {
        updateAddButton()
    }
    
    @IBAction func searchEditingChanged(_ sender: Any) {
        placeSelected = false
        
        guard let searchPattern = searchField.text else {
            searchResultsTableView.isHidden = true
            updateAddButton()
            return;
        }
        
        placesRepository.searchPlaces(with: searchPattern, completionHandler: { (places) in
            DispatchQueue.main.async {
                self.foundPlaces = places
                
                self.searchResultsTableView.reloadData()
                
                self.searchResultsTableView.isHidden = places == nil
                self.updateAddButton()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundPlaces?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchPlaceTableViewCell.key, for: indexPath) as! SearchPlaceTableViewCell
        
        let place = foundPlaces![indexPath.row]
        cell.update(from: place)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchCell = tableView.cellForRow(at: indexPath) as! SearchPlaceTableViewCell
        
        searchField.text = searchCell.addressLabel!.text
        
        placeSelected = true
        updateAddButton()
    }
}
