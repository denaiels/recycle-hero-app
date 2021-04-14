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
    var stageProgress = 3
    var itemToSendToWorkshopId: Int = 0

    var itemCountRecycled = 0
    var firstItemRecycled = false
    var allItemsRecycled = false
    var playground3Finished = false

    var userTouchBool = false
    var counter = 0
    var introAt = 1

    var image_0 = "empty"
    var image_1 = "empty"

    var item_list: [Item] = [Item(name: "item1", itemStage: 1, image: "item1", description: "item1", itemFound: true),Item(name: "item2", itemStage: 1, image: "item2", description: "item2", itemFound: true)]

    
    
    // MARK: - Outlets
    
    // Intro 1
    @IBOutlet weak var beachIntro1: UIView!
    @IBOutlet weak var beachIntro1LogoMascot: UIImageView!
    @IBOutlet weak var beachIntro1PartyHat: UIImageView!
    @IBOutlet weak var beachIntro1CloseLabel: UILabel!
    // Intro 2
    @IBOutlet weak var beachIntro2: UIView!
    // Intro 3
    @IBOutlet weak var beachIntro3: UIView!
    
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
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickWorkshopButton(_ sender: UIButton) {
       //go to workshop
    }

    // Action for each item button
    @IBAction func clickBottleButton(_ sender: UIButton) {
        item_list[counter] = normalItems[5]
        tempItemButton[counter] = bottleButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickWaterSprayerButton(_ sender: UIButton) {
        item_list[counter] = normalItems[13]
        tempItemButton[counter] = waterSprayerButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickStyrofoamButton(_ sender: UIButton) {
        item_list[counter] = normalItems[14]
        tempItemButton[counter] = styrofoamButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickSawButton(_ sender: UIButton) {
        item_list[counter] = normalItems[15]
        tempItemButton[counter] = sawButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickNewspaperButton1(_ sender: UIButton) {
        item_list[counter] = normalItems[1]
        tempItemButton[counter] = newspaperButton1
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickBranchesButton(_ sender: UIButton) {
        item_list[counter] = normalItems[16]
        tempItemButton[counter] = branchesButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickPilesOfWaterBottleButton(_ sender: UIButton) {
        item_list[counter] = normalItems[17]
        tempItemButton[counter] = pilesOfWaterBottleButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickTapeButton(_ sender: UIButton) {
        item_list[counter] = normalItems[18]
        tempItemButton[counter] = tapeButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickStrawButton(_ sender: UIButton) {
        item_list[counter] = normalItems[19]
        tempItemButton[counter] = strawButton
        userTouchBool = true
        itemToBin()
    }
    @IBAction func clickNewspaperButton2(_ sender: UIButton) {
        item_list[counter] = normalItems[1]
        tempItemButton[counter] = newspaperButton2
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
        if allItemsRecycled == true && itemCountRecycled == 5 && playground3Finished == false {
            beachIntro3.isHidden = false
            playground3Finished = true
        }
    }

    // Check if item suitable for recycling
    func compute_item() {
        if item_list[0].name == "Plastic Bottle" && item_list[1].name == "Plastic Water Sprayer"
            || item_list[0].name == "Plastic Water Sprayer" && item_list[1].name == "Plastic Bottle" {
            
            itemToSendToWorkshopId = 7
            print("Success! Bottle Water Gun is found")
            itemCountRecycled += 1
            
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[7].itemFound = true
                    
                    self.bottleWaterGun.isHidden = false
                    self.itemDeck1.image = UIImage(named: self.recycledItems[7].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[7].name
                    self.itemImage.image = UIImage(named: self.recycledItems[7].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
                }
            }
        
           
            bottleButton.isHidden = true
            waterSprayerButton.isHidden = true
        } else if item_list[0].name == "Styrofoam" && item_list[1].name == "Saw" || item_list[0].name == "Saw" && item_list[1].name == "Styrofoam"{
            
            print("Success! Surfboard is found")
            itemToSendToWorkshopId = 8
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[8].itemFound = true
                    
                    self.surfboard.isHidden = false
                    self.itemDeck2.image = UIImage(named: self.recycledItems[8].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[8].name
                    self.itemImage.image = UIImage(named: self.recycledItems[8].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
                }
            }
            styrofoamButton.isHidden = true
            sawButton.isHidden = true
           
        } else if item_list[0].name == "Newspaper" && item_list[1].name == "Fallen Branches" || item_list[0].name == "Fallen Branches" && item_list[1].name == "Newspaper"{
            
            print("Success! Newspaper Kite is found")
            itemToSendToWorkshopId = 9
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[9].itemFound = true
                    
                    self.newspaperKite.isHidden = false
                    self.itemDeck3.image = UIImage(named: self.recycledItems[9].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[9].name
                    self.itemImage.image = UIImage(named: self.recycledItems[9].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
            }
        }
            tempItemButton[0].isHidden = true
            tempItemButton[1].isHidden = true
           
        } else if item_list[0].name == "Piles of Water Bottles" && item_list[1].name == "Tape" || item_list[0].name == "Tape" && item_list[1].name == "Piles of Water Bottles"{
            
            print("Success! Bottle Boat is found")
            itemToSendToWorkshopId = 10
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[10].itemFound = true
                    
                    self.bottleBoat.isHidden = false
                    self.itemDeck4.image = UIImage(named: self.recycledItems[10].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[10].name
                    self.itemImage.image = UIImage(named: self.recycledItems[10].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
            }
        }
            pilesOfWaterBottleButton.isHidden = true
            tapeButton.isHidden = true
           
        } else if item_list[0].name == "Plastic Straw" && item_list[1].name == "Newspaper" || item_list[0].name == "Newspaper" && item_list[1].name == "Plastic Straw"{
            
            print("Success! Paper Windmill is found")
            itemToSendToWorkshopId = 11
            itemCountRecycled += 1
            // Change `2.0` to the desired number of seconds.
            // Code you want to be delayed
            do {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    //set true if item is found
                    //to be used for workshop
                    self.recycledItems[11].itemFound = true
                    
                    self.newspaperKite.isHidden = false
                    self.itemDeck5.image = UIImage(named: self.recycledItems[11].image)
                    self.backButton.isHidden = true
                    self.workshopButton.isHidden = true
                    self.itemNameLabel.text = self.recycledItems[11].name
                    self.itemImage.image = UIImage(named: self.recycledItems[11].image)
                    self.popupView.isHidden = false
                    self.logoMascot.isHidden = false
                    self.popupCloseLabel.isHidden = false
            }
        }
            tempItemButton[0].isHidden = true
            tempItemButton[1].isHidden = true
           
        } else {
            print("failed to recycle try again")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of seconds.
                // Code you want to be delayed
                self.tempItemButton[0].isHidden = false
                self.tempItemButton[1].isHidden = false
            }
            
            return
        }
        
        if itemCountRecycled == 5{
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
                print("popUpView -> intro1")
                introAt = 2
                beachIntro1.isHidden = true
                beachIntro1PartyHat.isHidden = true
                beachIntro1LogoMascot.isHidden = true
                beachIntro1CloseLabel.isHidden = true
                beachIntro2.isHidden = false
            } else if introAt == 2 && beachIntro2.isHidden != true{
                print("popUpView -> intro2")
                introAt = 3
                beachIntro2.isHidden = true
            } else if introAt == 3 && beachIntro3.isHidden != true{
                print("popUpView -> intro3")
                introAt = 0
                beachIntro3.isHidden = true
                performSegue(withIdentifier: "finishStage", sender: self)
            }
            print("popupView -> Tapped outside the view")
            print("beachIntro3 isHidden = \(beachIntro3.isHidden)")
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            checkItemProgress()
        } else if beachIntro1.frame.contains(location){
            if introAt == 1{
                print("intro1 -> intro1")
                introAt = 2
                beachIntro1.isHidden = true
                beachIntro1PartyHat.isHidden = true
                beachIntro1LogoMascot.isHidden = true
                beachIntro1CloseLabel.isHidden = true
                beachIntro2.isHidden = false
            } else if introAt == 2 && beachIntro2.isHidden != true{
                print("intro1 -> intro2")
                introAt = 3
                beachIntro2.isHidden = true
            } else if introAt == 3 && beachIntro3.isHidden != true{
                print("intro1 -> intro3")
                introAt = 0
                beachIntro3.isHidden = true
                performSegue(withIdentifier: "finishStage", sender: self)
            }
            print("intro1 -> Tapped outside the view")
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            checkItemProgress()
        } else if !beachIntro2.frame.contains(location){
            if introAt == 1{
                print("intro2 -> intro1")
                introAt = 2
                beachIntro1.isHidden = true
                beachIntro1PartyHat.isHidden = true
                beachIntro1LogoMascot.isHidden = true
                beachIntro1CloseLabel.isHidden = true
                beachIntro2.isHidden = false
            } else if introAt == 2 && beachIntro2.isHidden != true{
                print("intro2 -> intro2")
                introAt = 3
                beachIntro2.isHidden = true
            } else if introAt == 3 && beachIntro3.isHidden != true{
                print("intro2 -> intro3")
                introAt = 0
                beachIntro3.isHidden = true
                performSegue(withIdentifier: "finishStage", sender: self)
            }
            print("intro2 -> Tapped outside the view")
            backButton.isHidden = false
            workshopButton.isHidden = false
            popupView.isHidden = true
            logoMascot.isHidden = true
            popupCloseLabel.isHidden = true
            checkItemProgress()
        } else {
            print("Tapped inside the view")
        }
        print(introAt)
    }

    func initiateDefault() {
        
        //hide popup
        logoMascot.isHidden = true
        popupView.isHidden = true
        popupCloseLabel.isHidden = true
       
        //hide intro 2,3
        beachIntro2.isHidden = true
        beachIntro3.isHidden = true
       
        //hide recycled item
        bottleWaterGun.isHidden = true
        surfboard.isHidden = true
        newspaperKite.isHidden = true
        bottleBoat.isHidden = true
        paperWindmill.isHidden = true
       
        //placeholder for button object in array
        tempItemButton = [bottleButton, waterSprayerButton]
       
       
        for i in 0...normalItemNames.count-1 {
            normalItems.append(Item(name: normalItemNames[i], itemStage: normalItemStage[i], image: normalItemIconColor[i], description: normalItemDescription[i], itemFound: true))
        }

        for i in 0...recycledItemNames.count-1 {
            if i < 7 {
                recycledItems.append(RecycledItem(name:  recycledItemNames[i], itemStage: recycledItemStage[i], image: recycledItemIconColor[i], description: recycledItemDescription[i], itemFound: true, ingredient1Id: recycledItemIngredient1[i], ingredient2Id: recycledItemIngredient2[i], link: recycledItemLink[i]))
            } else {
                recycledItems.append(RecycledItem(name:  recycledItemNames[i], itemStage: recycledItemStage[i], image: recycledItemIconColor[i], description: recycledItemDescription[i], itemFound: recycledItemFound[i], ingredient1Id: recycledItemIngredient1[i], ingredient2Id: recycledItemIngredient2[i], link: recycledItemLink[i]))
            }
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
            destinationVC.stage = stageProgress
            destinationVC.message = "Ini dari Playground 3"
        }
        
        if let destinationVC = segue.destination as? ItemDetailViewController {
            destinationVC.item = recycledItems[itemToSendToWorkshopId]
        }
    }

}
