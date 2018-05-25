//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 19/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//
//They all have the same number or have three different numbers.
//They all have the same symbol or have three different symbols.
//They all have the same shading or have three different shadings.
//They all have the same color or have three different colors.
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
    static func == (lhs: Card, rhs: Card) -> Bool {
       return (lhs.color == rhs.color &&
        lhs.number == rhs.number &&
        lhs.shading == rhs.shading &&
        lhs.symbol == rhs.symbol) ||
        (lhs.color == rhs.color &&
        lhs.number != rhs.number &&
        lhs.shading != rhs.shading &&
        lhs.symbol != rhs.symbol) ||
        (lhs.color != rhs.color &&
        lhs.number == rhs.number &&
        lhs.shading != rhs.shading &&
        lhs.symbol != rhs.symbol) ||
        (lhs.color != rhs.color &&
        lhs.number != rhs.number &&
        lhs.shading == rhs.shading &&
        lhs.symbol != rhs.symbol) ||
        (lhs.color != rhs.color &&
        lhs.number != rhs.number &&
        lhs.shading != rhs.shading &&
        lhs.symbol == rhs.symbol) ||
        (lhs.color != rhs.color &&
        lhs.number != rhs.number &&
        lhs.shading != rhs.shading &&
        lhs.symbol != rhs.symbol)
    }

    var number = 0      //symbol stroke
    var symbol = 0
    var shading = 0     //symbol color
    var color = 0   //card background color
    
    var isSelected = false
    var isSet = false
    
}


