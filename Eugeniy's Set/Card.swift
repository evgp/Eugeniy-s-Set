//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 19/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

import Foundation

/**
 Cards are:
 3 different color background: red, green, yellow
 3 different shapes
 3 different colors of shapes
 3 different states of each card (back-color, shape-color, shape-symbol)
 
 3^4 = 81 different cards
 */

struct Card: Equatable {
    
    var number = 0
    var symbol = 0
    var shading = 0
    var color = 0
    
    var isSelected = false
    var isSet = false
    
}
