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
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]! {
        didSet {

            cardButtons.forEach() {
                $0.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            }
            deal(24)
            updateView()
        }
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if sender.activeCard {
            newGame.chooseCard(at: cardButtons.index(of: sender)!)
            updateView()
        }
    }
    
    func updateView() {
        
        // TODO: Deal 3 card
        cardButtons.forEach() {
            let index = cardButtons.index(of: $0)!
            if newGame.cardField[index].isSelected {
                $0.selectCard()
            } else {
                $0.noSelectCard()
            }
            
            if newGame.cardField[index].isSet {
                $0.deactivateCard(numberize(by: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), ""))
            }
            
            if !(newGame.cardField[index].isSet) && !($0.activeCard){
                $0.backgroundColor = newGame.cardField[index].color.background
                $0.setTitle(newGame.cardField[index].symbol.symbol, for: UIControlState.normal)
                $0.setAttributedTitle(
                    numberize(by: newGame.cardField[index].number.stroke, newGame.cardField[index].shading.color, newGame.cardField[index].symbol.symbol),
                    for: UIControlState.normal)
            }
        }
        
        if let _ = scoreLabel {
            scoreLabel.text = "Score: \(newGame.score)"
        }
        
        newGame.cardField.forEach() {
            if $0.isSet { newGame.cardField.remove(at: newGame.cardField.index(of: $0)!) }
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
        newGame.cardField.forEach() {
            let index = newGame.cardField.index(of: $0)!
            if $0.isSet { newGame.cardField.remove(at: index) }
        }
        var cc = cardCount
        
        repeat {
            let randomCard = newGame.cards[(newGame.cards.count-1).random]
            newGame.cardField.append(randomCard)
            newGame.cards.remove(at: newGame.cards.index(of: randomCard)!)
            cc -= 1
        } while cc != 0
        updateView()
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
    func deactivateCard(_ nsaString: NSAttributedString) {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.setTitle("", for: UIControlState.normal)
        self.setAttributedTitle(nsaString, for: UIControlState.normal)
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

