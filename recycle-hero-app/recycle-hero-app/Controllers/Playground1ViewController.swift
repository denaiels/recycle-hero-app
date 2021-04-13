//
//  Playground1ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 08/04/21.
//

import UIKit

class Playground1ViewController: UIViewController {
    
    var recycledItems = [RecycledItem]()
    var normalItems = [Item]()
    var userProgress = UserProgress()

    var itemCountRecycled = 0
    var firstItemRecycled = false
    var allItemsRecycled = false
    var playground1Finished = false

    var userTouchBool = false
    var counter = 0
    var introAt = 1

    var image_0 = "empty"
    var image_1 = "empty"

    var item_list: [Item] = [Item(name: "item1", itemStage: 1, image: "item1", description: "item1", itemFound: true),Item(name: "item2", itemStage: 1, image: "item2", description: "item2", itemFound: true)]

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
        itemToBin()
        
        
    }
    @IBAction func clickNewspaper(_ sender: UIButton) {
       item_list[counter] = normalItems[1]
       tempItemButton[counter] = newsPaperButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickLightBulb(_ sender: UIButton) {
       item_list[counter] = normalItems[2]
       tempItemButton[counter] = lightBulbButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickUsedCloth(_ sender: UIButton) {
       item_list[counter] = normalItems[3]
       tempItemButton[counter] = usedClothButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickScissors(_ sender: UIButton) {
       item_list[counter] = normalItems[4]
       tempItemButton[counter] = scissorsButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickPlasticBottle(_ sender: UIButton) {
       item_list[counter] = normalItems[5]
       tempItemButton[counter] = plasticBottleButton
       userTouchBool = true
        itemToBin()
    }

    //recycle bin evaluator
    @IBAction func clickRecycleBin(_ sender: UIButton) {
       //itemToBin()
    }
    
    func itemToBin(){
        if userTouchBool{
            if counter < 2{
                if counter == 0{
                    image0.image = UIImage(named: item_list[0].image)
                    print("image_0 is" + item_list[0].name)
                    tempItemButton[counter].isHidden = true
                    counter+=1
                     userTouchBool = false
                     
                } else if counter == 1{
                    image1.image = UIImage(named: item_list[1].image)
                    print("image_1 is" + item_list[1].name)
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
       if item_list[0].name == "Food Scrap" && item_list[1].name == "Newspaper" || item_list[0].name == "Newspaper" && item_list[1].name == "Food Scrap"{
           print("Succeess! Compost is found")
           itemCountRecycled += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            do{
                //set true if item is found
                //to be used for workshop
                self.recycledItems[0].itemFound = true
                
                self.compost.isHidden = false
                self.itemDeck2.image = UIImage(named: self.recycledItems[0].image)
                self.backButton.isHidden = true
                self.workshopButton.isHidden = true
                self.itemNameLabel.text = self.recycledItems[0].name
                self.itemImage.image = UIImage(named: self.recycledItems[0].image)
                self.popupView.isHidden = false
                self.logoMascot.isHidden = false
                self.popupCloseLabel.isHidden = false
            }
        }
           
           foodScrapButton.isHidden = true
           newsPaperButton.isHidden = true
       
       }else if item_list[0].name == "Plastic Bottle" && item_list[1].name == "Light Bulb" || item_list[0].name == "Light Bulb" && item_list[1].name == "Plastic Bottle"{ print("Succeess! Bottle Lamp is found")
           itemCountRecycled += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            do{
                //set true if item is found
                //to be used for workshop
                self.recycledItems[1].itemFound = true
                
                self.bottleLamp1.isHidden = false
                self.bottleLamp2.isHidden = false
                self.itemDeck1.image = UIImage(named: self.recycledItems[1].image)
                self.backButton.isHidden = true
                self.workshopButton.isHidden = true
                self.itemNameLabel.text = self.recycledItems[1].name
                self.itemImage.image = UIImage(named: self.recycledItems[1].image)
                self.popupView.isHidden = false
                self.logoMascot.isHidden = false
                self.popupCloseLabel.isHidden = false
            }
        }
           plasticBottleButton.isHidden = true
           lightBulbButton.isHidden = true
           
       }else if item_list[0].name == "Used Cloth" && item_list[1].name == "Scissors" || item_list[0].name == "Scissors" && item_list[1].name == "Used Cloth"{ print("Succeess! Wool Fiber is found")
           itemCountRecycled += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            do{
                //set true if item is found
                //to be used for workshop
                self.recycledItems[2].itemFound = true
                
                self.woolFiber.isHidden = false
                self.itemDeck3.image = UIImage(named: self.recycledItems[2].image)
                self.backButton.isHidden = true
                self.workshopButton.isHidden = true
                self.itemNameLabel.text = self.recycledItems[2].name
                self.itemImage.image = UIImage(named: self.recycledItems[2].image)
                self.popupView.isHidden = false
                self.logoMascot.isHidden = false
                self.popupCloseLabel.isHidden = false
            }
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
           
        normalItems.append(Item(name: normalItemNames[i], itemStage: 1, image: "\(normalItemIconColor[i]).png", description: normalItemDescription[i], itemFound: normalItemFound[i]))
       }

       for i in 0...recycledItemNames.count-1 {
        recycledItems.append(RecycledItem(name:  recycledItemNames[i], itemStage: recycledItemStage[i], image: "\(recycledItemIconColor[i]).png", description: recycledItemDescription[i], itemFound: recycledItemFound[i], ingredient1Id: recycledItemIngredient1[i], ingredient2Id: recycledItemIngredient2[i], link: recycledItemLink[i]))
       }
       
       
      
       
      /* print("-----NORMAL ITEMS-----")
       
       for i in 0...normalItemNames.count-1 {
    //            print(i)
           print("\(i) | Item Name: \(normalItems[i].name)")
    //            print("Item Icon Color: \(normalItems[i].image)")
    //            print("Item Icon Black: \(normalItems[i].item_icon_black)")
    //            print("Item Description: \(normalItems[i].item_description)")
    //            print("Item Found: \(normalItems[i].itemFound)")
       }
       
       print("\n-----RECYCLED ITEMS-----")
       
       for i in 0...recycledItemNames.count-1 {
    //            print(i)
           print("\(i) | Item Name: \(recycledItems[i].name)")
           print("--> Item Icon Color: \(recycledItems[i].image)")
           print("--> Item Icon Black: \(recycledItems[i].item_icon_black)")
           print("--> Item Description: \(recycledItems[i].item_description)")
           print("--> Item Found: \(recycledItems[i].itemFound)")
       }*/
       
   }

}
