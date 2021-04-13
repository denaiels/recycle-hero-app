//
//  StageMenuController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 07/04/21.
//

import UIKit


class StageMenuController: UIViewController {
    static var currentStage : Int? = 1

    // MARK: - Outlets
    
    @IBOutlet weak var bedroomView: UIView!
    @IBOutlet weak var gardenView: UIView!
    @IBOutlet weak var beachView: UIView!
    @IBOutlet weak var chooseStageLabel: UILabel!
    @IBOutlet weak var gardenLabel: UILabel!
    @IBOutlet weak var beachLabel: UILabel!
    @IBOutlet weak var gardenMask: UIImageView!
    @IBOutlet weak var beachMask: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseStageLabel.addCharacterSpacing()
        
        if let stage = StageMenuController.currentStage{
            if stage==1{
                gardenLabel.isHidden = true
                beachLabel.isHidden = true
                gardenMask.isHidden = false
                beachMask.isHidden = false
            }
            
            if stage==2{
                gardenLabel.isHidden = false
                gardenMask.isHidden = true
            }
            
            if stage==3{
                beachLabel.isHidden = false
                beachMask.isHidden = true
            }
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
