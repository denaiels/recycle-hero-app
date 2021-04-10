//
//  RecycledItem.swift
//  recycle-hero-app
//
//  Created by Maurice Tin on 10/04/21.
//

import Foundation

class RecycledItem : Item{
    var ingredient1Id : Int
    var ingredient2Id : Int
    var link : String
    
    init(name: String, itemStage: Int, image: String, description: String, itemFound: Bool, ingredient1Id: Int, ingredient2Id: Int, link: String) {
        
        self.ingredient1Id = ingredient1Id
        self.ingredient2Id = ingredient2Id
        self.link = link
        
        super.init(name: name, itemStage: itemStage, image: image, description: description, itemFound: itemFound)
    }
        
}
