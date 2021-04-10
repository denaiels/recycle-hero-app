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
    
    @IBOutlet weak var ingredient1Placeholder: UIImageView!
    
    
    @IBOutlet weak var ingredient2Placeholder: UIImageView!
    
    @IBOutlet weak var plusSymbol: UIImageView!
    
    
    @IBOutlet weak var ingredient1Label: UILabel!
    
    
    @IBOutlet weak var ingredient2Label: UILabel!
    
    var item : RecycledItemsModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        itemName.text = item?.item_name
        itemDescription.text = item?.item_description
        itemImage.image = UIImage(named: item!.item_icon_color)
        ingredient1Image.image = UIImage(named: normalItemIconColor[item!.item_ingredient_1_id])
        
        ingredient2Image.image = UIImage(named: normalItemIconColor[item!.item_ingredient_2_id])
        
        ingredient1Label.text = normalItemNames[item!.item_ingredient_1_id]
        ingredient2Label.text = normalItemNames[item!.item_ingredient_2_id]
    }
    
    @IBAction func watchVideo(_ sender: Any) {
        
        if let url = URL(string: item!.item_link){
            UIApplication.shared.open(url)
        }
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
