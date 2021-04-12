//
//  ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 07/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var recycledItems = [RecycledItemsModel]()
    var normalItems = [NormalItemsModel]()
    var userProgress = UserProgress()
    
    
    var counter = 0
    var item_list: [NormalItemsModel] = [NormalItemsModel(item_name: "item1", item_icon_color: "item1", item_icon_black: "item1", item_description: "item1", item_found: false),NormalItemsModel(item_name: "item1", item_icon_color: "item1", item_icon_black: "item1", item_description: "item1", item_found: false)]
    
    //var item_list = ["item1","item2"]
    var image_0 = "empty"
    var image_1 = "empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Hello world")
        
    
        
        
        initiateDefault()
    }
    
    //for the popup
    @IBOutlet weak var logoMascot: UIImageView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var popupCloseLabel: UILabel!
    
    //image in recycle bin
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    
    //item to recycle button
    @IBOutlet weak var foodScrapButton: UIButton!
    @IBOutlet weak var newsPaperButton: UIButton!
    @IBOutlet weak var lightBulbButton: UIButton!
    @IBOutlet weak var usedClothButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var plasticBottleButton: UIButton!
    
    
    //action for each item button
    @IBAction func clickFoodScrap(_ sender: UIButton) {
        item_list[counter] = normalItems[0]
    }
    
    @IBAction func clickNewspaper(_ sender: UIButton) {
        item_list[counter] = normalItems[1]
    }
    
    @IBAction func clickLightBulb(_ sender: UIButton) {
        item_list[counter] = normalItems[2]
    }
    
    @IBAction func clickUsedCloth(_ sender: UIButton) {
        item_list[counter] = normalItems[3]
    }
    
    @IBAction func clickScissors(_ sender: UIButton) {
        item_list[counter] = normalItems[4]
    }
    
    @IBAction func clickPlasticBottle(_ sender: UIButton) {
        item_list[counter] = normalItems[5]
    }
    
    //recycle bin evaluator
    @IBAction func clickRecycleBin(_ sender: UIButton) {
        if counter < 2{
            if counter == 0{
                image0.image = UIImage(named: item_list[0].item_icon_color)
                print("image_0 is" + item_list[0].item_name)
                counter+=1
            } else if counter == 1{
                image1.image = UIImage(named: item_list[1].item_icon_color)
                print("image_1 is" + item_list[1].item_name)
                
                compute_item()
                
                //image0.image = nil
                //image1.image = nil
                
                counter = 0
            } else{
                print("pass")
            }
        } else{
            print("nevermind")
        }
        if image0.image != nil && image1.image != nil{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
               // Code you want to be delayed
                self.image0.image = nil
                self.image1.image = nil
            }
        }
    }
    
    //check if item suitable for recycling
    func compute_item(){
        if item_list[0].item_name == "Food Scrap" && item_list[1].item_name == "Newspaper" || item_list[0].item_name == "Newspaper" && item_list[1].item_name == "Food Scrap"{
            print("Succeess! Compost is found")
            do{
                itemNameLabel.text = recycledItems[0].item_name
                itemImage.image = UIImage(named: recycledItems[0].item_icon_color)
                popupView.isHidden = false
                logoMascot.isHidden = false
                popupCloseLabel.isHidden = false
                
            }
            foodScrapButton.isHidden = true
            newsPaperButton.isHidden = true
        
        }else if item_list[0].item_name == "Plastic Bottle" && item_list[1].item_name == "Light Bulb" || item_list[0].item_name == "Light Bulb" && item_list[1].item_name == "Plastic Bottle"{ print("Succeess! Bottle Lamp is found")
            do{
                itemNameLabel.text = recycledItems[1].item_name
                itemImage.image = UIImage(named: recycledItems[1].item_icon_color)
                popupView.isHidden = false
                logoMascot.isHidden = false
                popupCloseLabel.isHidden = false
                
            }
            plasticBottleButton.isHidden = true
            lightBulbButton.isHidden = true
            
        }else if item_list[0].item_name == "Used Cloth" && item_list[1].item_name == "Scissors" || item_list[0].item_name == "Scissors" && item_list[1].item_name == "Used Cloth"{ print("Succeess! Wool Fiber is found")
            do{
                itemNameLabel.text = recycledItems[2].item_name
                itemImage.image = UIImage(named: recycledItems[2].item_icon_color)
                popupView.isHidden = false
                logoMascot.isHidden = false
                popupCloseLabel.isHidden = false
                
            }
            usedClothButton.isHidden = true
            scissorsButton.isHidden = true
            
        } else{
            print("failed to recycle try again")
        }
    }
    
    
    
    // close anywhere to close
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !popupView.frame.contains(location) {
            print("Tapped outside the view")
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
        } else {
            print("Tapped inside the view")
        }
    }
    
    func initiateDefault() {
        logoMascot.isHidden = true
        popupView.isHidden = true
        popupCloseLabel.isHidden = true
        
        
        for i in 0...normalItemNames.count-1 {
            normalItems.append(NormalItemsModel(item_name: normalItemNames[i], item_icon_color: "\(normalItemIconColor[i]).png", item_icon_black: "\(normalItemIconColor[i])Black.png", item_description: normalItemDescription[i], item_found: normalItemFound[i]))
        }
        
        for i in 0...recycledItemNames.count-1 {
            recycledItems.append(RecycledItemsModel(item_name: recycledItemNames[i], item_stage: recycledItemStage[i], item_ingredient_1_id: recycledItemIngredient1[i], item_ingredient_2_id: recycledItemIngredient2[i], item_icon_color: "\(recycledItemIconColor[i]).png", item_icon_black: "\(recycledItemIconColor[i])Black.png", item_description: recycledItemDescription[i], item_link: recycledItemLink[i], item_found: recycledItemFound[i]))
        }
        
        
       
        
       /* print("-----NORMAL ITEMS-----")
        
        for i in 0...normalItemNames.count-1 {
//            print(i)
            print("\(i) | Item Name: \(normalItems[i].item_name)")
//            print("Item Icon Color: \(normalItems[i].item_icon_color)")
//            print("Item Icon Black: \(normalItems[i].item_icon_black)")
//            print("Item Description: \(normalItems[i].item_description)")
//            print("Item Found: \(normalItems[i].item_found)")
        }
        
        print("\n-----RECYCLED ITEMS-----")
        
        for i in 0...recycledItemNames.count-1 {
//            print(i)
            print("\(i) | Item Name: \(recycledItems[i].item_name)")
            print("--> Item Icon Color: \(recycledItems[i].item_icon_color)")
            print("--> Item Icon Black: \(recycledItems[i].item_icon_black)")
            print("--> Item Description: \(recycledItems[i].item_description)")
            print("--> Item Found: \(recycledItems[i].item_found)")
        }*/
        
    }
     
}

