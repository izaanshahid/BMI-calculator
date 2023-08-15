import UIKit

struct CalculateBrain {
    
    
    var Bmi:String?
    
    mutating func calcBmi(height:Float, weight:Float) -> String {
        let formattedHeight = height * height
        //print("formatted height: ",formattedHeight)
        let bmi:Float = (weight/formattedHeight)
        Bmi = String(format: "%.2f",bmi)
        print(Bmi!)
        return Bmi!
    }
    
    func getBmiValue() -> String {
        return Bmi!
    }
    
    func getAdvice() -> String {
        if (Float(Bmi!)!<18.5){
            return "underweight"
        }
        else if (Float(Bmi!)!>24.9){
            return "Overweight"
        }
        else{
            return "Normal"
        }
    }
    
    func getColor() -> UIColor {
        if (Float(Bmi!)!<18.5){
            return .systemYellow
        }
        else if (Float(Bmi!)!>24.9){
            return .systemRed
        }
        else{
            return .systemBlue
            
        }
    }
}
