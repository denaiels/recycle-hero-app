//
//  ViewController.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 07/04/21.
//

import UIKit

class ViewController: UIViewController {
    
//    var recycledItems = [RecycledItemsModel]()
//    var normalItems = [NormalItemsModel]()
    var userProgress = UserProgress()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello world")
        initiateDefault()
    }
    
//    func initiateDefault() {
//        for i in 0...normalItemNames.count-1 {
//            normalItems.append(NormalItemsModel(item_name: normalItemNames[i], item_icon_color: "\(normalItemIconColor[i]).png", item_icon_black: "\(normalItemIconColor[i])Black.png", item_description: normalItemDescription[i], item_found: normalItemFound[i]))
//        }
//
//        for i in 0...recycledItemNames.count-1 {
//            recycledItems.append(RecycledItemsModel(item_name: recycledItemNames[i], item_stage: recycledItemStage[i], item_ingredient_1_id: recycledItemIngredient1[i], item_ingredient_2_id: recycledItemIngredient2[i], item_icon_color: "\(recycledItemIconColor[i]).png", item_icon_black: "\(recycledItemIconColor[i])Black.png", item_description: recycledItemDescription[i], item_link: recycledItemLink[i], item_found: recycledItemFound[i]))
//        }
//
//        print("-----NORMAL ITEMS-----")
//
//        for i in 0...normalItemNames.count-1 {
////            print(i)
//            print("\(i) | Item Name: \(normalItems[i].item_name)")
////            print("Item Icon Color: \(normalItems[i].item_icon_color)")
////            print("Item Icon Black: \(normalItems[i].item_icon_black)")
////            print("Item Description: \(normalItems[i].item_description)")
////            print("Item Found: \(normalItems[i].item_found)")
//        }
//
//        print("\n-----RECYCLED ITEMS-----")
//
//        for i in 0...recycledItemNames.count-1 {
////            print(i)
//            print("\(i) | Item Name: \(recycledItems[i].item_name)")
//            print("--> Item Icon Color: \(recycledItems[i].item_icon_color)")
//            print("--> Item Icon Black: \(recycledItems[i].item_icon_black)")
//            print("--> Item Description: \(recycledItems[i].item_description)")
//            print("--> Item Found: \(recycledItems[i].item_found)")
//        }
//
//    }
    
}
