//
//  ViewController.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 19/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private var newGame = gameSet()
//    private var selectedCards = [Card]()
    
    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
//            //deal cards per button
//            for index in 12...23 {
//                let button = cardButtons[index]
//                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//                button.setTitle("", for: UIControlState.normal)
//            
//            }
           deal(24)
            updateView()
        }
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        newGame.chooseCard(at: cardButtons.index(of: sender)!)
        updateView()
    }
    
    func updateView() {
        newGame.cardField.forEach() {
            if $0.value.isSelected {
                cardButtons[$0.key].selectCard()
            } else {
                cardButtons[$0.key].noSelectCard()
            }
        }
        
        newGame.cardField.forEach() {
            cardButtons[$0.key].backgroundColor = $0.value.color.background
            cardButtons[$0.key].setTitle($0.value.symbol.symbol, for: UIControlState.normal)
            cardButtons[$0.key].setAttributedTitle(
                numberize(by: $0.value.number.stroke, $0.value.shading.color, $0.value.symbol.symbol),
                for: UIControlState.normal)
        }
    }
    
    @IBOutlet weak var cardsLeft: UILabel!
    
    @IBAction func dealMore(_ sender: UIButton) {
            deal(3)
    }
    
    private func numberize(by color: UIColor, _ fColor: UIColor, _ symbol: String) -> NSAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : -8.0,
            .strokeColor : color,
            .foregroundColor : fColor
        ]
        return NSAttributedString(string: symbol, attributes: attributes)
    }
    
    func deal(_ cardCount: Int) {
        var cc = cardCount
        while cc != 0 {
            let randomCard = newGame.cards[(newGame.cards.count-1).random]
            newGame.cardField[newGame.cardField.count] = randomCard
            newGame.cards.remove(at: newGame.cards.index(of: randomCard)!)
            cc -= 1
        }
        updateView()
//
//
//            for button in cardButtons {
//
//                    let randomCardIndex = (newGame.cards.count-1).random
//                    let randomCardFromDeck = newGame.cards[randomCardIndex]
//                    newGame.cardField[cardButtons.index(of: button)!] = randomCardFromDeck
//                    newGame.cards.remove(at: randomCardIndex)
//            }
    }
    
}

extension UIButton {
    var activeCard: Bool {
       return self.backgroundColor == #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) ? false : true
    }
    
    func selectCard() {
        self.layer.borderWidth = 2.5
        self.layer.borderColor = UIColor.blue.cgColor
    }
    func noSelectCard() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    func deactivateCard() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.setTitle("", for: UIControlState.normal)
    }
    func activateCard() {
//        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
//        self.setTitle("", for: UIControlState.normal)
    }
}

extension Int {
    var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
    var background: UIColor {
        switch self {
        case 1: return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 2: return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 3: return #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        default: return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    var color: UIColor {
        switch self {
        case 1: return #colorLiteral(red: 0.4229060016, green: 0.4388156243, blue: 0.770421794, alpha: 1)
        case 2: return #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        case 3: return #colorLiteral(red: 0.7130310959, green: 0.1157009136, blue: 0.770421794, alpha: 1)
        default: return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    var stroke: UIColor {
        switch self {
        case 1: return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case 2: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case 3: return #colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)
        default: return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    var symbol: String {
        switch self {
        case 1: return "▲"
        case 2: return"●"
        case 3: return"■"
        default: return "!"
        }
    }
    
}

