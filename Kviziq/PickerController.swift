//
//  ViewController.swift
//  Kviziq
//
//  Created by Palino on 03/10/2022.
//

import UIKit

class PickerController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var kvizPicker: UIPickerView!
    var kvizArray = [String]()
    var vybratyKviz = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.resourcePath!
        let items = try! FileManager.default.contentsOfDirectory(atPath: path)
        
        for item in items where item.hasPrefix("Kviz ") {
            kvizArray.append(item)
        }
        
        kvizArray.sort()
        
        kvizPicker.dataSource = self
        kvizPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kvizArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rozdel = kvizArray[row].components(separatedBy: ".")
        return rozdel[0]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        vybratyKviz = kvizArray[row]
    }
}

