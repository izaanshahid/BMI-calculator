//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //handles
    @IBOutlet weak var heightHandle: UISlider!
    @IBOutlet weak var weightHandle: UISlider!
    //labels
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    var calculateBrain = CalculateBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let number = sender.value
        let formattedNumber = String(format: "%.2f", number)
        let result = Double(formattedNumber)
        print("height: ", result!)
        heightLabel.text = formattedNumber + "m"
    }
    
    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weight = Int(sender.value)
        print("weight: ", weight)
        weightLabel.text = String(weight)+"Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightHandle.value
        let weight = weightHandle.value
        calculateBrain.calcBmi(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculateBrain.getBmiValue()
            resultVC.advice = calculateBrain.getAdvice()
            resultVC.color = calculateBrain.getColor()
        }
            
    }
    
    
    
    
}

