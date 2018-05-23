//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 19/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

import Foundation
import UIKit

/**
 Cards are:
 3 different color background: red, green, yellow
 3 different shapes
 3 different colors of shapes
 3 different states of each card (back-color, shape-color, shape-symbol)
 
 3^4 = 81 different cards
 */

struct Card {
//    static func == (lhs: Card, rhs: Card) -> Bool {
//        return lhs.index == rhs.index
//    }
    
//    enum symbol: Character {
//        case triangle = "▲"
//        case squre = "■"
//        case circle = "●"
//    }
    
    enum symbol: Int {
        case triangle, square, circle
        func value() -> Character {
            switch self {
            case .triangle: return "▲"
            case .circle: return "●"
            case .square: return "■"
            }
        }
    }
    
    enum background: Int {
        case first, second, third
        func value() -> UIColor {
            switch self {
            case .first: return UIColor(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            case .second: return UIColor(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            case .third: return UIColor(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
            }
        }
    }
    
    enum shade: Int {
        case first, second, third
    }
    
    enum number: Int {
        case one, two, three
    }
    
//    var index = 0
//    var number: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    var symbol = "0"
//    var shading: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    var isSelected = false
    var isSet = false
    
}

extension Card {
    static var backgroundColor: UIColor {return Card.background.value()}
}

