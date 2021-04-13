//
//  RecycledItemsModel.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 07/04/21.
//

import Foundation

<<<<<<< HEAD:recycle-hero-app/recycle-hero-app/Data/RecycledItemsData.swift
var recycledItemsCountStage1 = 3
=======
struct RecycledItemsModel {
    var item_name = ""
    var item_stage = 0
    var item_ingredient_1_id = 0
    var item_ingredient_2_id = 0
    var item_icon_color = ""
    var item_icon_black = ""
    var item_description = ""
    var item_link = ""
    var item_found = false
}

>>>>>>> workshop:recycle-hero-app/recycle-hero-app/RecycledItemsModel.swift
var recycledItemNames = ["Compost", "Bottle Lamp", "Wool Fiber", "Plant Bottle", "Bird House", "Watering Jug", "Fertilizer", "Bottle Water Gun", "Surfboard", "Newspaper Kite", "Bottle Boat", "Paper Windmill"]
var recycledItemStage = [1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3]
var recycledItemIngredient1 = [0, 5, 3, 5, 7, 9, 11, 5, 14, 1, 17, 19]
var recycledItemIngredient2 = [1, 2, 4, 6, 8, 10, 12, 13, 15, 16, 18, 1]
var recycledItemIconColor =
    ["compost",
     "bottleLamp",
     "woolFiber",
     "plantBottle",
     "birdhouseCanPaint",
     "wateringJug",
     "fertilizer",
     "bottleWaterGun",
     "surfboard",
     "newspaperKite",
     "bottleBoat",
     "paperWindmill"]
var recycledItemDescription =
    ["Compost is organic material that can be added to soil to help plants grow.",
     "A recycled product from Plastic Bottle and Light Bulb. You can use this to light up your bedroom ",
     "Wool is the textile fiber. You can use wool for knitting",
     "A recycled product from Plastic Bottle to contain your small plant",
     "A simple recycled product from Paint Can. You can fill this with seeds, and the birds will come",
     "A recycled product from Milk Jug to water your seeds or plants at home",
     "Banana fertilizer is fertilizer composed from Banana Peels, can be added to soil to help plants grow.",
     "A recycled product from Plastic Bottle and Water Sprayer. You can use this to water your plants",
     "A recycled product from Styrofoam. You can use this to play on the beach.",
     "A kite made of old newspapers that you can play in the backyard of your home.",
     "A recycled product from Piles of Water Bottles. You can make this to play at beach when in a holiday!",
     "A recycled product from Plastic Straw and  old Newspaper. You can use this to play in a breezy day."]
var recycledItemLink =
    ["https://www.youtube.com/watch?v=kA3q07paNbE",
     "https://www.youtube.com/watch?v=Z_nySChubms",
     "https://www.youtube.com/watch?v=7i0QMnz4ExY",
     "https://onelittleproject.com/plastic-bottle-planters/",
     "https://blog.gardenloversclub.com/gardens/recycled-gardens/",
     "http://ajourneytoadream.blogspot.com/2012/03/helpful-yet-simple-diy-for-spring.html",
     "https://www.stonefamilyfarmstead.com/banana-peel-fertilizer/?utm_content=bufferf7fd1&utm_medium=social&utm_source=facebook.com&utm_campaign=buffer",
     "https://www.youtube.com/watch?v=Tqe-vFHGruI",
     "https://www.youtube.com/watch?v=QmOoJjHRavE",
     "https://www.youtube.com/watch?v=u8cI7EN97oU",
     "https://www.youtube.com/watch?v=AAESdIGouZs",
     "https://www.youtube.com/watch?v=sBLj1VP_stM"]
var recycledItemFound = [false, false, false, false, false, false, false, false, false, false, false, false]

