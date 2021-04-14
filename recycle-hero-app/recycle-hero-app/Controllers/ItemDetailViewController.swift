//
//  ItemDetailViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 10/04/21.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var ingredient1Image: UIImageView!
    @IBOutlet weak var ingredient2Image: UIImageView!
    @IBOutlet weak var ingredient1Label: UILabel!
    @IBOutlet weak var ingredient2Label: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var item : RecycledItem? = nil
    var stage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemName.text = item?.name
        itemDescription.text = item?.description
        itemImage.image = UIImage(named: "\(item!.image).png")
        ingredient1Image.image = UIImage(named: normalItemIconColor[item!.ingredient1Id])
        
        ingredient2Image.image = UIImage(named: normalItemIconColor[item!.ingredient2Id])
        
        ingredient1Label.text = normalItemNames[item!.ingredient1Id]
        ingredient2Label.text = normalItemNames[item!.ingredient2Id]
        
        var imageName : String
        
        if stage==1{
            imageName="bedroomStage1"
        }else if stage==2{
            imageName="gardenStage2"
        }else{
            imageName="beachStage3"
        }
        backgroundImage.image = UIImage(named: imageName)
    }
    
    @IBAction func watchVideo(_ sender: Any) {
        
        if let url = URL(string: item!.link){
            UIApplication.shared.open(url)
        }
    }
    
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
