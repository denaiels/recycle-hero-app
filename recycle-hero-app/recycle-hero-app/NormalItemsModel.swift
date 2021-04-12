//
//  NormalItemsModel.swift
//  recycle-hero-app
//
//  Created by Daniel Santoso on 08/04/21.
//

import Foundation

struct NormalItemsModel {
    var item_name = ""
    var item_icon_color = ""
    var item_icon_black = ""
    var item_description = ""
    var item_found = false
}

var normalItemNames = ["Food Scrap", "Newspaper", "Light Bulb", "Used Cloth", "Scissors", "Plastic Bottle", "Small Plant", "Paint Can", "Ribbon", "Milk Jug", "Needle", "Banana Peels", "Water", "Plastic Water Sprayer", "Stryofoam", "Saw", "Fallen Branches", "Piles of Water Bottles", "Tape", "Plastic Straw"]
var normalItemIconColor = ["foodScrap", "newspaper", "lightBulb", "usedCloth", "scissors", "bottle", "smallPlant", "paintCan", "ribbon", "milkJug", "needle", "bananaPeels", "water", "plasticWaterSprayer", "styrofoam", "saw", "branches", "pilesOfWaterBottles", "tape", "plasticStraw"]
var normalItemDescription =
    ["Food waste or food loss that is not eaten.",
     "A newspaper is a publication printed on paper and issued regularly, usually once a day or once a week.",
     "A tools used to convert electricity into light, consisting of a source of illumination, enclosed within a transparent shell.",
     "A piece of clothing that has been worn previously.",
     "An instrument used for cutting cloth, paper, and other thin material.",
     "A bottle constructed from high-density or low density plastic.",
     "A living organism that typically absorbing water and inorganic substances through its roots, and synthesizing nutrients in its leaves by photosynthesis.",
     "A cylindrical metal container for paint.",
     "A long, narrow strip of fabric, used for tying something or for decoration.",
     "A large plastic container used for holding and pouring milk.",
     "A very fine slender piece of metal with a point at one end and a hole, used in sewing.",
     "The outer covering or rind of a banana.",
     "A colorless, transparent, odorless liquid.",
     "A tools used to blow water.",
     "A kind of expanded polystyrene.",
     "A hand tool for cutting wood or other materials, thin serrated steel blade.",
     "A part of a tree which grows out from the trunk or from a bough.",
     "A collection of bottles.",
     "A narrow strip of material, typically used to hold or fasten something.",
     "A thin hollow tube of paper or plastic for sucking drink from a glass or bottle."]
var normalItemFound = [true, true, true, true, true, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

