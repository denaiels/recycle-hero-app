//
//  StageMenuController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 07/04/21.
//

import UIKit


class StageMenuController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var chooseStageLabel: UILabel!
    @IBOutlet weak var gardenLabel: UILabel!
    @IBOutlet weak var beachLabel: UILabel!
    @IBOutlet weak var gardenMask: UIImageView!
    @IBOutlet weak var beachMask: UIImageView!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseStageLabel.addCharacterSpacing()
        
        if let stage = defaults.string(forKey: "stage") {
            
//            if stage.isEmpty{
//                defaults.setValue("1", forKey: "stage")
//                gardenLabel.isHidden = true
//                beachLabel.isHidden = true
//                gardenMask.isHidden = false
//                beachMask.isHidden = false
//            }
            
            if stage=="1"{
                print("stage 1 unlocked")
                gardenLabel.isHidden = true
                beachLabel.isHidden = true
                gardenMask.isHidden = false
                beachMask.isHidden = false
            }
            
            else if stage=="2"{
                print("stage 2 unlocked")
                gardenLabel.isHidden = false
                gardenMask.isHidden = true
                beachLabel.isHidden = true
                print("beach label is hidden: \(beachLabel.isHidden)")
            }
            
            else if stage=="3"{
                print("stage 3 unlocked")
                beachLabel.isHidden = false
                beachMask.isHidden = true
            }
        }else{
            defaults.set("1", forKey: "stage")
            gardenLabel.isHidden = true
            beachLabel.isHidden = true
            gardenMask.isHidden = false
            beachMask.isHidden = false
            print("else called")
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goToBedroom(_ sender: Any) {
        
        performSegue(withIdentifier:"showBedroom" , sender: self)
    }
    
    @IBAction func goToGarden(_ sender: Any) {
        
       /* if let stage = defaults.string(forKey: "stage"){
            
            if stage.isEmpty{
                return
            }else if stage == "2"{
                performSegue(withIdentifier: "showGarden", sender: self)
            }
        } */
        performSegue(withIdentifier: "showGarden", sender: self)
    }
    
    @IBAction func goToBeach(_ sender: Any) {
        
        if let stage = defaults.string(forKey: "stage"){
            
            if stage.isEmpty{
                return
            }else if stage == "3"{
                performSegue(withIdentifier: "showBeach", sender: self)
            }
        }
    }
    
    
    
}

extension UILabel{
    func addCharacterSpacing(kernValue: Double = 1.15){
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range:NSRange(location: 0, length: attributedString.length-1))
            
            attributedText = attributedString
        }
    }
}
