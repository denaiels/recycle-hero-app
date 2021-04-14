//
//  Playground2ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 12/04/21.
//

import UIKit

class Playground2ViewController: UIViewController {
    
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
    var playground2Finished = false

    var userTouchBool = false
    var counter = 0
    var introAt = 1

    var image_0 = "empty"
    var image_1 = "empty"

    var item_list: [Item] = [Item(name: "item1", itemStage: 1, image: "item1", description: "item1", itemFound: true),Item(name: "item2", itemStage: 1, image: "item2", description: "item2", itemFound: true)]

    
    
    // MARK: - Outlets
    
    //intro 1
    @IBOutlet weak var gardenIntro1: UIView!
    //intro 2
    @IBOutlet weak var gardenIntro2: UIView!
    //intro 3
    @IBOutlet weak var gardenIntro3: UIView!
 

    // Item in deck (done)
    @IBOutlet weak var itemDeck1: UIImageView!
    @IBOutlet weak var itemDeck2: UIImageView!
    @IBOutlet weak var itemDeck3: UIImageView!
    @IBOutlet weak var itemDeck4: UIImageView!
    

    // Recycled item image (done)
    @IBOutlet weak var plantBottle1: UIImageView!
    @IBOutlet weak var plantBottle2: UIImageView!
    @IBOutlet weak var plantBottle3: UIImageView!
    @IBOutlet weak var wateringJug: UIImageView!
    @IBOutlet weak var birdHouse: UIImageView!
    @IBOutlet weak var fertilizer: UIImageView!

    //new stage popup
    @IBOutlet weak var intro1LogoMascot: UIImageView!
    @IBOutlet weak var intro1PartyHat: UIImageView!
    @IBOutlet weak var intro1CloseAnywhere: UILabel!
    
    
    // Popup (done)
    @IBOutlet weak var logoMascot: UIImageView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var popupCloseLabel: UILabel!

    // Image in recycle bin (done)
    @IBOutlet weak var image0: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    
    //item to recycle stage 2 goes here (done)
    @IBOutlet weak var pilesOfWaterBottlesButton: UIButton!
    @IBOutlet weak var smallPlantButton: UIButton!
    @IBOutlet weak var paintCanButton: UIButton!
    @IBOutlet weak var ribbonButton: UIButton!
    @IBOutlet weak var needleButton: UIButton!
    @IBOutlet weak var milkJugButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    
    
    // Back Button(done)
    @IBOutlet weak var backButton: UIButton!
    // Workshop Button(done)
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
    @IBAction func clickPilesOfWaterBottles(_ sender: UIButton) {
       item_list[counter] = normalItems[17]
       tempItemButton[counter] = pilesOfWaterBottlesButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickSmallPlant(_ sender: UIButton) {
       item_list[counter] = normalItems[6]
       tempItemButton[counter] = smallPlantButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickPaintCan(_ sender: UIButton) {
       item_list[counter] = normalItems[7]
       tempItemButton[counter] = paintCanButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickRibbon(_ sender: UIButton) {
       item_list[counter] = normalItems[8]
       tempItemButton[counter] = ribbonButton
       userTouchBool = true
        itemToBin()
    }
    
    @IBAction func clickNeedle(_ sender: UIButton) {
       item_list[counter] = normalItems[10]
       tempItemButton[counter] = needleButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickMilkJug(_ sender: UIButton) {
       item_list[counter] = normalItems[9]
       tempItemButton[counter] = milkJugButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickBanana(_ sender: UIButton) {
       item_list[counter] = normalItems[11]
       tempItemButton[counter] = bananaButton
       userTouchBool = true
        itemToBin()
    }
    @IBAction func clickWater(_ sender: UIButton) {
       item_list[counter] = normalItems[12]
       tempItemButton[counter] = waterButton
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
            //gardenIntro3.isHidden = false
            firstItemRecycled = true
        } else if allItemsRecycled == true && itemCountRecycled == 4 && playground2Finished == false {
            gardenIntro3.isHidden = false
            playground2Finished = true
        }
    }

    // Check if item suitable for recycling
    func compute_item() {
        if item_list[0].name == "Piles of Water Bottles" && item_list[1].name == "Small Plant"
            || item_list[0].name == "Small Plant" && item_list[1].name == "Piles of Water Bottles" {
            
            itemToSendToWorkshopId = 3
            print("Success! Plant Bottle is found")
            itemCountRecycled += 1
            
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[3].itemFound = true
                    
                    self.plantBottle1.isHidden = false
                    self.plantBottle2.isHidden = false
                    self.plantBottle3.isHidden = false
                    self.itemDeck1.image = UIImage(named: self.recycledItems[3].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[3].name
                    self.itemImage.image = UIImage(named: self.recycledItems[3].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
                }
            }
        
           
            pilesOfWaterBottlesButton.isHidden = true
            smallPlantButton.isHidden = true
        } else if item_list[0].name == "Paint Can" && item_list[1].name == "Ribbon" || item_list[0].name == "Ribbon" && item_list[1].name == "Paint Can"{ print("Succeess! Bird House is found")
            
            itemToSendToWorkshopId = 4
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[4].itemFound = true
                    
                    self.birdHouse.isHidden = false
                    self.itemDeck2.image = UIImage(named: self.recycledItems[4].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[4].name
                    self.itemImage.image = UIImage(named: self.recycledItems[4].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
                }
            }
            paintCanButton.isHidden = true
            ribbonButton.isHidden = true
           
        } else if item_list[0].name == "Milk Jug" && item_list[1].name == "Needle" || item_list[0].name == "Needle" &&    item_list[1].name == "Milk Jug"{ print("Succeess! Watering Jug is found")
            
            itemToSendToWorkshopId = 5
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[5].itemFound = true
                    
                    self.wateringJug.isHidden = false
                    self.itemDeck3.image = UIImage(named: self.recycledItems[5].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[5].name
                    self.itemImage.image = UIImage(named: self.recycledItems[5].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
            }
        }
            milkJugButton.isHidden = true
            needleButton.isHidden = true
           
        } else if item_list[0].name == "Banana Peels" && item_list[1].name == "Water" || item_list[0].name == "Water" &&    item_list[1].name == "Banana Peels"{ print("Succeess! Fertilizer is found")
            
            itemToSendToWorkshopId = 6
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[6].itemFound = true
                    
                    self.fertilizer.isHidden = false
                    self.itemDeck4.image = UIImage(named: self.recycledItems[6].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[6].name
                    self.itemImage.image = UIImage(named: self.recycledItems[6].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
            }
        }
            bananaButton.isHidden = true
            waterButton.isHidden = true
           
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
                gardenIntro1.isHidden = true
                gardenIntro2.isHidden = false
            } else if introAt == 2 && gardenIntro2.isHidden != true{
                print("intro2")
                introAt = 3
                gardenIntro2.isHidden = true
            } else if introAt == 3 && gardenIntro3.isHidden != true{
                print("intro3")
                introAt = 4
                gardenIntro3.isHidden = true
            }
            print("Tapped outside the view")
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            intro1CloseAnywhere.isHidden = true
            
            //clearing new stage popup
            intro1LogoMascot.isHidden = true
            gardenIntro1.isHidden = true
            intro1PartyHat.isHidden = true
            checkItemProgress()
        } else if gardenIntro2.frame.contains(location){
            if introAt == 1{
                print("intro1")
                introAt = 2
                gardenIntro1.isHidden = true
                gardenIntro2.isHidden = false
            } else if introAt == 2 && gardenIntro2.isHidden != true{
                print("intro2")
                introAt = 3
                gardenIntro2.isHidden = true
            } else if introAt == 3 && gardenIntro3.isHidden != true{
                print("intro3")
                introAt = 4
                gardenIntro3.isHidden = true
            }
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            intro1CloseAnywhere.isHidden = true
            
            //clearing new stage popup
            intro1LogoMascot.isHidden = true
            gardenIntro1.isHidden = true
            intro1PartyHat.isHidden = true
            checkItemProgress()
        } else if !gardenIntro1.frame.contains(location){
            if introAt == 1{
                print("intro1")
                introAt = 2
                gardenIntro1.isHidden = true
                gardenIntro2.isHidden = false
            } else if introAt == 2 && gardenIntro2.isHidden != true{
                print("intro2")
                introAt = 3
                gardenIntro2.isHidden = true
            } else if introAt == 3 && gardenIntro3.isHidden != true{
                print("intro3")
                introAt = 4
                gardenIntro3.isHidden = true
            }
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            intro1CloseAnywhere.isHidden = true
            
            //clearing new stage popup
            intro1LogoMascot.isHidden = true
            gardenIntro1.isHidden = true
            intro1PartyHat.isHidden = true
            checkItemProgress()
        }else {
            popupCloseLabel.isHidden = true
            print("Tapped inside the view")
        }
        popupCloseLabel.isHidden = true
        print(introAt)
    }

    func initiateDefault() {
        
        //hide popup
        logoMascot.isHidden = true
        popupView.isHidden = true
        popupCloseLabel.isHidden = true
        
        //hide new stage popup
        //gardenIntro1.isHidden = true
        //intro1PartyHat.isHidden = true
        //intro1LogoMascot.isHidden = true
       
        //hide intro 2,3
        gardenIntro2.isHidden = true
        gardenIntro3.isHidden = true
     
       
        //hide recycled item (done)
        plantBottle1.isHidden = true
        plantBottle2.isHidden = true
        plantBottle3.isHidden = true
        wateringJug.isHidden = true
        birdHouse.isHidden = true
        fertilizer.isHidden = true
       
        //placeholder for button object in array
        tempItemButton = [pilesOfWaterBottlesButton,smallPlantButton]
       
       
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
            destinationVC.message = "Ini dari Playground 2"
        }
        
        if let destinationVC = segue.destination as? ItemDetailViewController {
            destinationVC.item = recycledItems[itemToSendToWorkshopId]
        }
        
//        if let destinationVC = segue.destination as? StageMenuController {
////            destinationVC.item = recycledItems[itemToSendToWorkshopId]
//        }
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
