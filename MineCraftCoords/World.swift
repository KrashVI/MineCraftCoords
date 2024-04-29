//
//  World.swift
//  MineCraftCoords
//
//  Created by SPRING, SEAN on 4/29/24.
//

import Foundation
import SwiftData

@Model
class World{
    var name: String
    var timeCreated: Date
    var Overworld: [OverWorldCoord]
    var Nether: [NetherCoord]
    var TheEnd: [TheEndCoord]
    
    init(name: String = "",
         timeCreated: Date = .now,
         Overworld: [OverWorldCoord] = [],
         Nether: [NetherCoord] = [],
         TheEnd: [TheEndCoord] = []){
        self.name = name
        self.timeCreated = timeCreated
        self.Overworld = Overworld
        self.Nether = Nether
        self.TheEnd = TheEnd
    }
}
