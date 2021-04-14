//
//  Playground3ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 12/04/21.
//

import UIKit

class Playground3ViewController: UIViewController {

    // MARK: - Properties
    
    var recycledItems = [RecycledItem]()
    var normalItems = [Item]()
//    var userProgress = UserProgress()
    var workshopItems = [Item]()
    var tempItemButton:[UIButton] = [UIButton]()
    var stageProgress = 1
    var itemToSendToWorkshopId: Int = 0

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

    
    
    // MARK: - Outlets
    
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

    // Item in deck
    @IBOutlet weak var itemDeck1: UIImageView!
    @IBOutlet weak var itemDeck2: UIImageView!
    @IBOutlet weak var itemDeck3: UIImageView!
    @IBOutlet weak var itemDeck4: UIImageView!
    @IBOutlet weak var itemDeck5: UIImageView!
    
    // Recycled item image
    @IBOutlet weak var bottleWaterGun: UIImageView!
    @IBOutlet weak var surfboard: UIImageView!
    @IBOutlet weak var newspaperKite: UIImageView!
    @IBOutlet weak var bottleBoat: UIImageView!
    @IBOutlet weak var paperWindmill: UIImageView!
    
    // Popup
    @IBOutlet weak var logoMascot: UIImageView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var popupCloseLabel: UILabel!

    // Image in recycle bin
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!

    // Item to recycle button
    @IBOutlet weak var bottleButton: UIButton!
    @IBOutlet weak var waterSprayerButton: UIButton!
    @IBOutlet weak var styrofoamButton: UIButton!
    @IBOutlet weak var sawButton: UIButton!
    @IBOutlet weak var newspaperButton1: UIButton!
    @IBOutlet weak var branchesButton: UIButton!
    @IBOutlet weak var pilesOfWaterBottleButton: UIButton!
    @IBOutlet weak var tapeButton: UIButton!
    @IBOutlet weak var strawButton: UIButton!
    @IBOutlet weak var newspaperButton2: UIButton!

    // Back Button
    @IBOutlet weak var backButton: UIButton!
    // Workshop Button
    @IBOutlet weak var workshopButton: UIButton!
    
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
       super.viewDidLoad()
       
       initiateDefault()
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func clickBackButton(_ sender: UIButton) {
        
    }
    
    @IBAction func clickWorkshopButton(_ sender: UIButton) {
       //go to workshop
    }

    // Action for each item button
    @IBAction func clickBottleButton(_ sender: UIButton) {
    }
    @IBAction func clickWaterSprayerButton(_ sender: UIButton) {
    }
    @IBAction func clickStyrofoamButton(_ sender: UIButton) {
    }
    @IBAction func clickSawButton(_ sender: UIButton) {
    }
    @IBAction func clickNewspaperButton1(_ sender: UIButton) {
    }
    @IBAction func clickBranchesButton(_ sender: UIButton) {
    }
    @IBAction func clickPilesOfWaterBottleButton(_ sender: UIButton) {
    }
    @IBAction func clickTapeButton(_ sender: UIButton) {
    }
    @IBAction func clickStrawButton(_ sender: UIButton) {
    }
    @IBAction func clickNewspaperButton2(_ sender: UIButton) {
    }
    
    
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

    // Recycle bin evaluator
    @IBAction func clickRecycleBin(_ sender: UIButton) {
       //itemToBin()
    }
    
    // Open In Workshop Action
    @IBAction func openInWorkshopDidTap(_ sender: UIButton) {
        popupView.isHidden = true
        logoMascot.isHidden = true
        popupCloseLabel.isHidden = true
        checkItemProgress()
    }
    
    // MARK: - Helper Functions
    
    func itemToBin() {
        if userTouchBool {
            if counter < 2 {
                if counter == 0 {
                    image0.image = UIImage(named: item_list[0].image)
                    print("image_0 is" + item_list[0].name)
                    tempItemButton[counter].isHidden = true
                    counter+=1
                     userTouchBool = false
                     
                } else if counter == 1 {
                    image1.image = UIImage(named: item_list[1].image)
                    print("image_1 is" + item_list[1].name)
                    tempItemButton[counter].isHidden = true
                    compute_item()
                    counter = 0
                    userTouchBool = false
                } else {
                    print("pass")
                }
            } else {
                print("pass")
            }
        }
        else {
            print("pass")
        }
        
        //remove image from bin with delay
        if image0.image != nil && image1.image != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
               // Code you want to be delayed
                self.image0.image = nil
                self.image1.image = nil
            }
        }
    }

    func checkItemProgress() {
        if firstItemRecycled == false && itemCountRecycled == 1{
            bedroomIntro3.isHidden = false
            firstItemRecycled = true
        } else if allItemsRecycled == true && itemCountRecycled == 3 && playground1Finished == false {
            bedroomIntro5.isHidden = false
            playground1Finished = true
        }
    }

    // Check if item suitable for recycling
    func compute_item() {
        if item_list[0].name == "Food Scrap" && item_list[1].name == "Newspaper"
            || item_list[0].name == "Newspaper" && item_list[1].name == "Food Scrap" {
            
            itemToSendToWorkshopId = 0
            print("Success! Compost is found")
            itemCountRecycled += 1
            
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
        } else if item_list[0].name == "Plastic Bottle" && item_list[1].name == "Light Bulb" || item_list[0].name == "Light Bulb" && item_list[1].name == "Plastic Bottle"{ print("Succeess! Bottle Lamp is found")
            
            itemToSendToWorkshopId = 1
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
           
        } else if item_list[0].name == "Used Cloth" && item_list[1].name == "Scissors" || item_list[0].name == "Scissors" &&    item_list[1].name == "Used Cloth"{ print("Succeess! Wool Fiber is found")
            
            itemToSendToWorkshopId = 2
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
           
        } else {
            print("failed to recycle try again")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                // Code you want to be delayed
                self.tempItemButton[0].isHidden = false
                self.tempItemButton[1].isHidden = false
            }
            
            return
        }
        
        if itemCountRecycled == 3{
            allItemsRecycled = true
        }
    }

    // Tap anywhere to close
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
            normalItems.append(Item(name: normalItemNames[i], itemStage: 1, image: normalItemIconColor[i], description: normalItemDescription[i], itemFound: normalItemFound[i]))
        }

        for i in 0...recycledItemNames.count-1 {
            recycledItems.append(RecycledItem(name:  recycledItemNames[i], itemStage: recycledItemStage[i], image: recycledItemIconColor[i], description: recycledItemDescription[i], itemFound: recycledItemFound[i], ingredient1Id: recycledItemIngredient1[i], ingredient2Id: recycledItemIngredient2[i], link: recycledItemLink[i]))
        }
        
        workshopItems.append(contentsOf: normalItems)
        workshopItems.append(contentsOf: recycledItems)
        
        // Print items
        printItems()
    }
    
    func printItems() {
        print("-----NORMAL ITEMS-----")
        
        for i in 0...normalItemsCountStage1-1 {
            print("\(i) | Item Name: \(normalItems[i].name)")
            print("Item Icon Color: \(normalItems[i].image)")
            print("Item Icon Black: \(normalItems[i].imageBlack)")
            print("Item Description: \(normalItems[i].description)")
            print("Item Found: \(normalItems[i].itemFound)")
        }
        
        print("\n-----RECYCLED ITEMS-----")
        
        for i in 0...recycledItemsCountStage1-1 {
            print("\(i) | Item Name: \(recycledItems[i].name)")
            print("--> Item Icon Color: \(recycledItems[i].image)")
            print("--> Item Icon Black: \(recycledItems[i].imageBlack)")
            print("--> Item Description: \(recycledItems[i].description)")
            print("--> Item Found: \(recycledItems[i].itemFound)")
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WorkshopViewController {
            destinationVC.items = workshopItems
            destinationVC.message = "Ini dari Playground 1"
        }
        
        if let destinationVC = segue.destination as? ItemDetailViewController {
            destinationVC.item = recycledItems[itemToSendToWorkshopId]
        }
        
        if let destinationVC = segue.destination as? StageMenuController {
//            destinationVC.item = recycledItems[itemToSendToWorkshopId]
        }
    }

}
