//
//  AddCityViewController.swift
//  borala
//
//  Created by Rober on 21/09/23.
//

import UIKit
import GooglePlaces
import FirebaseFirestore
import Firebase

class AddCityViewController: UIViewController {
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    let db = Firestore.firestore()
    var auth: Auth?
    var placeID: String = ""
    var nameID: String = ""
    
    @IBOutlet var pickerCity: UIPickerView!
    @IBOutlet weak var aceptButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var exitDatePicker: UIDatePicker!
    @IBOutlet weak var destinationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(datePicker)
        configElements()
        addSearch()
    }
    
    func configElements(){
        navigationController?.navigationBar.isHidden = true
        datePicker.center = view.center
        datePicker.locale = Locale(identifier: "pt")
        exitDatePicker.locale = Locale(identifier: "pt")
    }
    
    @IBAction func aceptTapped(_ sender: UIButton) {
        print("Accepted")
        addUserData()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        print("Canceled")
        navigationController?.popToRootViewController(animated: true)
    }
    
    func addSearch(){
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        let subView = UIView(frame: CGRect(x: 0, y: 60.0, width: 350.0, height: 45.0))
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = true
        definesPresentationContext = true
        navigationController?.navigationBar.isHidden = true
    }
    
    func addUserData(){
        let idLocation: String = self.placeID
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateIn = dateFormatter.string(from: self.datePicker.date)
        let dateExit = dateFormatter.string(from: self.exitDatePicker.date)
        let nameID: String = self.nameID
        let userID = Auth.auth().currentUser?.uid
        db.collection("trip").document(userID ?? "").setData( [
            "idLocation": idLocation,
            "dateIn": dateIn,
            "dateExit": dateExit,
            "nameID": nameID
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(String(describing: userID))")
            }
        }
    }
}

extension AddCityViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        print("Place name: \(String(describing: place.name))")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(String(describing: place.rating))")
        print("Place id: \(String(describing: place.placeID))")
        print("place coordenadas\(String(describing: place.coordinate))")
        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude

        let formattedCoordinates = "\(latitude)%2C\(longitude))"
        print("\(formattedCoordinates)")

        placeID = place.placeID ?? ""
        nameID = place.name ?? ""
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,didFailAutocompleteWithError error: Error){
        print("Error: ", error.localizedDescription)
    }
    
}

