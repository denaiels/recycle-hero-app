//
//  StageMenuController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 07/04/21.
//

import UIKit

class StageMenuController: UIViewController {

    @IBOutlet weak var bedroomView: UIView!
    
    
    @IBOutlet weak var gardenView: UIView!
    
    @IBOutlet weak var beachView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bedroomView.layer.cornerRadius = 10
        gardenView.layer.cornerRadius = 10
        beachView.layer.cornerRadius = 10
        
        
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
