//
//  Playground1ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 08/04/21.
//

import UIKit

class Playground1ViewController: UIViewController {

   var recycledItems = [RecycledItemsModel]()
   var normalItems = [NormalItemsModel]()
   var userProgress = UserProgress()
   
   
   var itemCountRecycled = 0
   var firstItemRecycled = false
   var allItemsRecycled = false
   var playground1Finished = false
   
   var userTouchBool = false
   var counter = 0
   var introAt = 1
   var item_list: [NormalItemsModel] = [NormalItemsModel(item_name: "item1", item_icon_color: "item1", item_icon_black: "item1", item_description: "item1", item_found: false),NormalItemsModel(item_name: "item1", item_icon_color: "item1", item_icon_black: "item1", item_description: "item1", item_found: false)]
   
   
   var image_0 = "empty"
   var image_1 = "empty"
   
   override func viewDidLoad() {
       super.viewDidLoad()
       
       //print("Hello world")
       
   
       
       
       initiateDefault()
   }
   //intro 1
   @IBOutlet weak var bedroomIntro1: UIView!
   
   //intro 2
   @IBOutlet weak var bedroomIntro2: UIView!
   
   //intro 3
   @IBOutlet weak var bedroomIntro3: UIView!
   
   //intro 4
   @IBOutlet weak var bedroomIntro4: UIView!
   
   //intro 5
   @IBOutlet weak var bedroomIntro5: UIView!
   
   
   
   
   
   
   //for item in deck
   @IBOutlet weak var itemDeck1: UIImageView!
   @IBOutlet weak var itemDeck2: UIImageView!
   @IBOutlet weak var itemDeck3: UIImageView!
   
   //for recycled item image
   @IBOutlet weak var bottleLamp1: UIImageView!
   @IBOutlet weak var bottleLamp2: UIImageView!
   @IBOutlet weak var woolFiber: UIImageView!
   @IBOutlet weak var compost: UIImageView!
   
   
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
   var tempItemButton:[UIButton] = [UIButton]()
   
   //back button
   @IBOutlet weak var backButton: UIButton!
   @IBAction func clickBackButton(_ sender: UIButton) {
       //go back to stage
   }
   //workshop button
   @IBOutlet weak var workshopButton: UIButton!
   @IBAction func clickWorkshopButton(_ sender: UIButton) {
       //go to workshop
   }
   
   
   //action for each item button
   @IBAction func clickFoodScrap(_ sender: UIButton) {
       item_list[counter] = normalItems[0]
       tempItemButton[counter] = foodScrapButton
       userTouchBool = true
   }
   @IBAction func clickNewspaper(_ sender: UIButton) {
       item_list[counter] = normalItems[1]
       tempItemButton[counter] = newsPaperButton
       userTouchBool = true
   }
   @IBAction func clickLightBulb(_ sender: UIButton) {
       item_list[counter] = normalItems[2]
       tempItemButton[counter] = lightBulbButton
       userTouchBool = true
   }
   @IBAction func clickUsedCloth(_ sender: UIButton) {
       item_list[counter] = normalItems[3]
       tempItemButton[counter] = usedClothButton
       userTouchBool = true
   }
   @IBAction func clickScissors(_ sender: UIButton) {
       item_list[counter] = normalItems[4]
       tempItemButton[counter] = scissorsButton
       userTouchBool = true
   }
   @IBAction func clickPlasticBottle(_ sender: UIButton) {
       item_list[counter] = normalItems[5]
       tempItemButton[counter] = plasticBottleButton
       userTouchBool = true
   }
   
   //recycle bin evaluator
   @IBAction func clickRecycleBin(_ sender: UIButton) {
       if userTouchBool{
           if counter < 2{
               if counter == 0{
                   image0.image = UIImage(named: item_list[0].item_icon_color)
                   print("image_0 is" + item_list[0].item_name)
                   tempItemButton[counter].isHidden = true
                   counter+=1
               } else if counter == 1{
                   image1.image = UIImage(named: item_list[1].item_icon_color)
                   print("image_1 is" + item_list[1].item_name)
                   tempItemButton[counter].isHidden = true
                   compute_item()
                   counter = 0
                   userTouchBool = false
               } else{
                   print("pass")
               }
           } else{
               print("pass")
           }
       }
       else{
           print("pass")
           
       }
       
       //remove image from bin with delay
       if image0.image != nil && image1.image != nil{
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
              // Code you want to be delayed
               self.image0.image = nil
               self.image1.image = nil
           }
       }
   }
   
   func checkItemProgress(){
       if firstItemRecycled == false && itemCountRecycled == 1{
           bedroomIntro3.isHidden = false
           firstItemRecycled = true
       } else if allItemsRecycled == true && itemCountRecycled == 3 && playground1Finished == false{
           bedroomIntro5.isHidden = false
           playground1Finished = true
       }
       
   }
   
   //check if item suitable for recycling
   func compute_item(){
       if item_list[0].item_name == "Food Scrap" && item_list[1].item_name == "Newspaper" || item_list[0].item_name == "Newspaper" && item_list[1].item_name == "Food Scrap"{
           print("Succeess! Compost is found")
           itemCountRecycled += 1
           do{
               //set true if item is found
               //to be used for workshop
               recycledItems[0].item_found = true
               
               compost.isHidden = false
               itemDeck2.image = UIImage(named: recycledItems[0].item_icon_color)
               backButton.isHidden = true
               workshopButton.isHidden = true
               itemNameLabel.text = recycledItems[0].item_name
               itemImage.image = UIImage(named: recycledItems[0].item_icon_color)
               popupView.isHidden = false
               logoMascot.isHidden = false
               popupCloseLabel.isHidden = false
           }
           foodScrapButton.isHidden = true
           newsPaperButton.isHidden = true
       
       }else if item_list[0].item_name == "Plastic Bottle" && item_list[1].item_name == "Light Bulb" || item_list[0].item_name == "Light Bulb" && item_list[1].item_name == "Plastic Bottle"{ print("Succeess! Bottle Lamp is found")
           itemCountRecycled += 1
           do{
               //set true if item is found
               //to be used for workshop
               recycledItems[1].item_found = true
               
               bottleLamp1.isHidden = false
               bottleLamp2.isHidden = false
               itemDeck1.image = UIImage(named: recycledItems[1].item_icon_color)
               backButton.isHidden = true
               workshopButton.isHidden = true
               itemNameLabel.text = recycledItems[1].item_name
               itemImage.image = UIImage(named: recycledItems[1].item_icon_color)
               popupView.isHidden = false
               logoMascot.isHidden = false
               popupCloseLabel.isHidden = false
           }
           plasticBottleButton.isHidden = true
           lightBulbButton.isHidden = true
           
       }else if item_list[0].item_name == "Used Cloth" && item_list[1].item_name == "Scissors" || item_list[0].item_name == "Scissors" && item_list[1].item_name == "Used Cloth"{ print("Succeess! Wool Fiber is found")
           itemCountRecycled += 1
           do{
               //set true if item is found
               //to be used for workshop
               recycledItems[2].item_found = true
               
               woolFiber.isHidden = false
               itemDeck3.image = UIImage(named: recycledItems[2].item_icon_color)
               backButton.isHidden = true
               workshopButton.isHidden = true
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
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
              // Code you want to be delayed
               self.tempItemButton[0].isHidden = false
               self.tempItemButton[1].isHidden = false
           }
           
       }
       if itemCountRecycled == 3{
           allItemsRecycled = true
       }
   }
   
   
   
   // close anywhere to close
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       super.touchesBegan(touches, with: event)

       let touch = touches.first
       guard let location = touch?.location(in: self.view) else { return }
       if !popupView.frame.contains(location) {
           if introAt == 1{
               print("intro1")
               introAt = 2
               bedroomIntro1.isHidden = true
               bedroomIntro2.isHidden = false
           } else if introAt == 2 && bedroomIntro2.isHidden != true{
               print("intro2")
               introAt = 3
               bedroomIntro2.isHidden = true
           } else if introAt == 3 && bedroomIntro3.isHidden != true{
               print("intro3")
               introAt = 4
               bedroomIntro3.isHidden = true
               bedroomIntro4.isHidden = false
           } else if introAt == 4 && bedroomIntro4.isHidden != true{
               print("intro4")
               introAt = 5
               bedroomIntro4.isHidden = true
           } else if introAt == 5 && bedroomIntro5.isHidden != true{
               print("intro5")
               introAt = 0
               bedroomIntro5.isHidden = true
           }
           print("Tapped outside the view")
           backButton.isHidden = false
           workshopButton.isHidden = false
           popupView.isHidden = true
           logoMascot.isHidden = true
           popupCloseLabel.isHidden = true
           checkItemProgress()
       } else if bedroomIntro1.frame.contains(location){
           if introAt == 1{
               print("intro1")
               introAt = 2
               bedroomIntro1.isHidden = true
               bedroomIntro2.isHidden = false
           } else if introAt == 2 && bedroomIntro2.isHidden != true{
               print("intro2")
               introAt = 3
               bedroomIntro2.isHidden = true
           } else if introAt == 3 && bedroomIntro3.isHidden != true{
               print("intro3")
               introAt = 4
               bedroomIntro3.isHidden = true
               bedroomIntro4.isHidden = false
           } else if introAt == 4 && bedroomIntro4.isHidden != true{
               print("intro4")
               introAt = 5
               bedroomIntro4.isHidden = true
           } else if introAt == 5 && bedroomIntro5.isHidden != true{
               print("intro5")
               introAt = 0
               bedroomIntro5.isHidden = true
           }
           
           
           
       }else {
           print("Tapped inside the view")
       }
       print(introAt)
   }
   
   
   func initiateDefault() {
       //hide popup
       logoMascot.isHidden = true
       popupView.isHidden = true
       popupCloseLabel.isHidden = true
       
       //hide intro 2,3,4,5
       bedroomIntro2.isHidden = true
       bedroomIntro3.isHidden = true
       bedroomIntro4.isHidden = true
       bedroomIntro5.isHidden = true
       
       //hide recycled item
       bottleLamp1.isHidden = true
       bottleLamp2.isHidden = true
       compost.isHidden = true
       woolFiber.isHidden = true
       
       //placeholder for button object in array
       tempItemButton = [foodScrapButton,newsPaperButton]
       
       
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
