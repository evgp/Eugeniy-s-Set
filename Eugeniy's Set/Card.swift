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
 3 different stroke of shapes
 
 3^4 = 81 different cards
 */

struct Card: Equatable {
  

//

//
//    enum shade: Int {
//        case first, second, third
//    }
//
//    enum number: Int {
//        case one, two, three
//    }
//
    var number = 0      //symbol stroke
    var symbol = 0
    var shading = 0     //symbol color
    var color = 0   //card background color
    
    var isSelected = false
    var isSet = false
    
}


