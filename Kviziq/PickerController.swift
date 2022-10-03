//
//  ViewController.swift
//  Kviziq
//
//  Created by Palino on 03/10/2022.
//

import UIKit

class PickerController: UIViewController {
    
    @IBOutlet weak var kvizPicker: UIPickerView!
    var kvizArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.resourcePath!
        let items = try! FileManager.default.contentsOfDirectory(atPath: path)
        
        for item in items where item.hasPrefix("Kviz ") {
            kvizArray.append(item)
        }
        
        print(kvizArray)
    }
}

