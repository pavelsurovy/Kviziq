//
//  KvizController.swift
//  Kviziq
//
//  Created by Palino on 03/10/2022.
//

import UIKit

class KvizController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var otazkaLbl: UILabel!
    @IBOutlet var odpovedeBtn: [UIButton]!
    @IBOutlet weak var nextQuestionBtn: UIButton!
    
    var kviz = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(kviz)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func validate(_ sender: UIButton) {
        print("validate")
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        print("next")
    }
}
