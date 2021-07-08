//
//  ViewController.swift
//  IMC
//
//  Created by Sidraque on 26/06/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var btCalculate: UIButton!
    @IBOutlet weak var lbIdealWeight: UILabel!
    @IBOutlet weak var weightHidden: UILabel!
    
    var imc: Double = 0
    var idealWeight: Double = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCalculate.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func tfEnableButton(_ sender: UITextField) {
        if (tfWeight.text == "" || tfHeight.text == ""){
            btCalculate.isHidden = true
        }else{
            btCalculate.isHidden = false
        }
    }
    
    func showResults(){
       var result: String = ""
       var image: String = ""
        
       switch imc {
            case 0..<16:
                result = "Magreza"
                image = "magreza"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso normal"
                image = "normal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        
        }
        lbResult.text = "\(Float16(imc)): \(result)"
        lbIdealWeight.text = "\(Float16(idealWeight))"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
    func hiddenTrue(){
        ivResult.isHidden = true
        weightHidden.isHidden = true
        lbIdealWeight.isHidden = true
        lbResult.isHidden = true
    }
    
    func hiddenFalse(){
        ivResult.isHidden = false
        weightHidden.isHidden = false
        lbIdealWeight.isHidden = false
    }
    
    
    
    
    @IBAction func calculate(_ sender: Any) {

        let formatter = NumberFormatter()
        
        let weight = formatter.number(from: tfWeight.text!)!.doubleValue
        let height = formatter.number(from: tfHeight.text!)!.doubleValue
        
        if(weight == 0 || height == 0){
            hiddenTrue()
        }else{
            imc = weight / pow(height, 2)
            idealWeight = 21.75 * pow(height,2)
            hiddenFalse()
            showResults()
        }
    }
}

