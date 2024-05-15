//
//  World.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/29/24.
//

import Foundation
import SwiftData

@Model
class Bookmark{
    var name: String
    var XCoord: Double
    var YCoord: Double
    var ZCoord: Double
    var worldType: String
    var matchingID: String
    
    init(name: String = "",
         XCoord: Double = 0,
         YCoord: Double = 0,
         ZCoord: Double = 0,
         worldType: String = "",
         matchingID: String = ""){
        self.name = name
        self.XCoord = XCoord
        self.YCoord = YCoord
        self.ZCoord = ZCoord
        self.worldType = worldType
        self.matchingID = matchingID
    }
}
