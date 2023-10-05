//
//  AddCityViewController.swift
//  borala
//
//  Created by Rober on 21/09/23.
//

import UIKit

class AddCityViewController: UIViewController {
    
    @IBOutlet var pickerCity: UIPickerView!
    @IBOutlet weak var aceptButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let cities = [
        "Tóquio, Japão",
        "Delhi, Índia",
        "Shangai, China",
        "São Paulo,Brasil",
        "Rio de Janeiro, Brasil",
        "Cidade do México, México",
        "Cairo, Egito",
        "Buenos Aires, Argentina",
        "Santiago, Chile",
        "Bogotá, Colômbia",
        "Lima, Peru"
    ]
 
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerCity.dataSource = self
        pickerCity.delegate = self
        
        view.addSubview(datePicker)
        datePicker.center = view.center
    }
    
    @IBAction func aceptTapped(_ sender: UIButton) {
        print("Accepted")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        print("Canceled")
        navigationController?.popToRootViewController(animated: true)
    }

}

extension AddCityViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
}

extension AddCityViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
}
