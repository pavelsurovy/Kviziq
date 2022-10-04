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
    
    var otazky: [Kviz]?
    var kviz = ""
    var aktualnaOtazka = 0
    var spravnaOdpoved = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadJson()
        nacitajOtazku()
        print(otazky)
    }
    
    @IBAction func validate(_ sender: UIButton) {
        nextQuestionBtn.isEnabled = true
        
        for odpoved in odpovedeBtn {
            odpoved.disabledButtonStyle()
            if odpoved.currentTitle!.contains(spravnaOdpoved) {
                odpoved.backgroundColor = Farby.zelena
            }
        }
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        aktualnaOtazka += 1
        
        if aktualnaOtazka >= otazky!.count {
            print("koniec")
            aktualnaOtazka = 0
        } else {
            nacitajOtazku()
        }
    }
    
    func loadJson() {
        if let bundlePath = Bundle.main.path(forResource: kviz, ofType: nil),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
           let parsedData = try? JSONDecoder().decode([Kviz].self, from: jsonData) {
            otazky = parsedData
        }
    }
    
    func nacitajOtazku() {
        nextQuestionBtn.isEnabled = false
        
        spravnaOdpoved = otazky![aktualnaOtazka].odpovede[0]
        
        image.image = UIImage(named: otazky![aktualnaOtazka].obrazok)
        otazkaLbl.text = otazky![aktualnaOtazka].otazka
        
        guard let rozhadzaneOdpovede = otazky?[aktualnaOtazka].odpovede.shuffled() else { return }
        
        for (index, odpovedBtn) in odpovedeBtn.enumerated() {
            odpovedBtn.enabledButtonStyle()
            
            odpovedBtn.setTitle(rozhadzaneOdpovede[index], for: .normal)
        }
    }
}
