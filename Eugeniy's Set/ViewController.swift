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
            //deal cards per button
            for index in 12...23 {
                let button = cardButtons[index]
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.setTitle("", for: UIControlState.normal)
            
            }
           _ = deal()
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
    }
    
    @IBOutlet weak var cardsLeft: UILabel!
    
    @IBAction func dealMore(_ sender: UIButton) {
        _ = deal(3)
    }
    
    private func numberize(by color: UIColor, _ fColor: UIColor, _ symbol: String) -> NSAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : -8.0,
            .strokeColor : color,
            .foregroundColor : fColor
        ]
        return NSAttributedString(string: symbol, attributes: attributes)
    }
    
    func deal(_ cards: Int = 0) -> Bool {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                if button.backgroundColor != #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) {
                    let randomCardIndex = (newGame.cards.count-1).random
                    let randomCardFromDeck = newGame.cards[randomCardIndex]
                    
                    newGame.cardField[index] = randomCardFromDeck
                    newGame.cards.remove(at: randomCardIndex)
                    
                    button.backgroundColor = randomCardFromDeck.color.background
                    button.setTitle(randomCardFromDeck.symbol.symbol, for: UIControlState.normal)
                    button.setAttributedTitle(numberize(by: randomCardFromDeck.number.stroke, randomCardFromDeck.shading.color, randomCardFromDeck.symbol.symbol), for: UIControlState.normal)
                }
            }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// let x = 5.arc4random. - extansion for Int, 5 is the "self"
extension UIButton {
    func selectCard() {
        self.layer.borderWidth = 2.5
        self.layer.borderColor = UIColor.blue.cgColor
    }
    func noSelectCard() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
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
        default: return "!!!"
        }
    }
    
}

