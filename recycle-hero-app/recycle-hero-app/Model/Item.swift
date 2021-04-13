//
//  Item.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 10/04/21.
//

import Foundation

class Item{
    var name: String
    var itemStage: Int
    var image: String
    var imageBlack: String
    var description: String
    var itemFound: Bool
    var type: String
    
    init(name: String, itemStage: Int, image: String, description: String, itemFound: Bool) {
        
        self.name = name
        self.itemStage = itemStage
        self.image = image
        self.imageBlack = "\(self.image)Black.png"
        self.description = description
        self.itemFound = itemFound
        self.type = "normal"
    }
    
    func foundItem(){
        self.itemFound = true
    }
}

