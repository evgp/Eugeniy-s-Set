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

struct Card: Hashable {
    var hashValue: Int {return idC}
    
    static func isSet(_ lhs: Card, _ rhs: Card) -> Bool {
       return
        // MARK: simple set for testing purpose
//                (lhs.color == rhs.color ||
//                lhs.number == rhs.number ||
//                lhs.shading == rhs.shading ||
//                lhs.symbol == rhs.symbol)

        (lhs.color == rhs.color &&
        lhs.number == rhs.number &&
        lhs.shading == rhs.shading &&
        lhs.symbol == rhs.symbol)
        ||
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
    
    private(set) var idC = 0
    var number = 0      //symbol stroke
    var symbol = 0
    var shading = 0     //symbol color
    var color = 0   //card background color
    
    var isSelected = false
    var isSet = false
    
    private static var idCFactory = 0
    
    private static func getId() -> Int {
        idCFactory += 1
        return idCFactory
    }
    
    init(_ number: Int, _ symbol: Int, _ shading: Int, _ color: Int, _ isSelected: Bool,_ isSet: Bool) {

        //        self.idC += 1 we should not use this, because there is no stored previous id in class. let's use private static property... as Paul tought us...
        self.idC = Card.getId()
        self.color = color
        self.number = number
        self.symbol = symbol
        self.shading = shading
        self.isSet = isSet
        self.isSelected = isSelected
    }
    
    
}


