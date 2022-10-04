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
    var skore = 0
    
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
        
        if sender.currentTitle!.contains(spravnaOdpoved) {
            skore += 1
        }
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        aktualnaOtazka += 1
        
        if aktualnaOtazka >= otazky!.count {
            
            let endKviz = UIAlertController(
                title: "Koniec kvízu",
                message: "Zajraj si ďalšiu hru!",
                preferredStyle: .alert)
            
            endKviz.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }
            ))
            
            endKviz.addAction(UIAlertAction(
                title: "NOK",
                style: .destructive,
                handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                }
            ))
            
            present(endKviz, animated: true)
            
            print(skore)
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
        otazkaLbl.text = "\(aktualnaOtazka + 1). \(otazky![aktualnaOtazka].otazka)"
        
        guard let rozhadzaneOdpovede = otazky?[aktualnaOtazka].odpovede.shuffled() else { return }
        
        for (index, odpovedBtn) in odpovedeBtn.enumerated() {
            odpovedBtn.enabledButtonStyle()
            
            odpovedBtn.setTitle(rozhadzaneOdpovede[index], for: .normal)
        }
    }
}
