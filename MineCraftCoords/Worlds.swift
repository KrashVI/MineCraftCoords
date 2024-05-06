//
//  Worlds.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/29/24.
//

import Foundation
import SwiftData

@Model
class Worlds{
    
    var name: String
    var timeCreated: Date
    var worldID: String
    
    init(name: String = "",
         timeCreated: Date = .now,
         worldID: String = ""){
        self.name = name
        self.timeCreated = timeCreated
        self.worldID = worldID
    }
}
