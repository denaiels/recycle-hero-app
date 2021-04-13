//
//  NormalItemDetailViewController.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 12/04/21.
//

import UIKit

class NormalItemDetailViewController: UIViewController {
    
    
    var item : Item? = nil
    
    @IBOutlet weak var itemLabel: UILabel!
    
    
    @IBOutlet weak var itemDescription: UILabel!
    
    
    @IBOutlet weak var itemImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemLabel.text = item!.name
        itemDescription.text = item!.description
        itemImage.image = UIImage(named: "\(item!.image).png")
        // Do any additional setup after loading the view.
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
