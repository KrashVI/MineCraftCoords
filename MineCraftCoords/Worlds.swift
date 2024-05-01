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
    var coords:[Bookmark] = [Bookmark]()
    
    init(name: String = "",
         timeCreated: Date = .now,
         coords: [Bookmark] = [Bookmark]()){
        self.name = name
        self.timeCreated = timeCreated
        self.coords = coords
    }
}
