//
//  NormalItemDetailViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 12/04/21.
//

import UIKit

class NormalItemDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var item : Item? = nil
    var stage = 0
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.text = item!.name
        itemDescription.text = item!.description
        itemImage.image = UIImage(named: "\(item!.image).png")
        
        var imageName : String
        
        if stage==1{
            imageName="bedroomStage1"
        }else if stage==2{
            imageName="gardenStage2"
        }else{
            imageName="beachStage3"
        }
        backgroundImage.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func backToWorkshop(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
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
