//
//  SetModel.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 21/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

//A set consists of three cards satisfying all of these conditions:
//
//They all have the same number or have three different numbers.
//They all have the same symbol or have three different symbols.
//They all have the same shading or have three different shadings.
//They all have the same color or have three different colors.

import Foundation

struct gameSet {
    var cards = [Card]()
    var cardField = [Card]()
    private func selectedIndices() -> [Int] {
        var indices = [Int]()
        cardField.forEach() {
            if $0.isSelected { indices.append(cardField.index(of: $0)!) }
        }
        return indices
    }
    
    private func getCard(by index: Int) -> Card {
        return cardField[index]
    }
    
    var score = 0
    
    mutating func chooseCard(at index: Int) {
        cardField[index].isSelected = !cardField[index].isSelected
        if selectedIndices().count > 2 {
            if compareCards(selectedIndices()) {
                selectedIndices().forEach(){
                    cardField[$0].isSet = true
                    cardField[$0].isSelected = false
                }
                score += 1
            } else {
                selectedIndices().forEach(){
                    cardField[$0].isSelected = false
                }
            }
        }
    }
    
    private func compareCards(_ choosenCards: Array<Int>) -> Bool {
        if  Card.isSet(getCard(by: choosenCards[1]), getCard(by: choosenCards[2])) &&
            Card.isSet(getCard(by: choosenCards[0]), getCard(by: choosenCards[1])) &&
            Card.isSet(getCard(by: choosenCards[0]), getCard(by: choosenCards[2])) {
            return true
        } else { return false }
        
    }
    
    init () {
        for num in 1...3 {
            for sym in 1...3 {
                for sha in 1...3 {
                    for col in 1...3 {
                        cards += [Card(num, sym, sha, col, false, false)]
                    }
                }
            }
        }
    }

}

