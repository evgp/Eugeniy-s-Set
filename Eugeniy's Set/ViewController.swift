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
    private var selectedCards = [Card]()
    
    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            //deal cards per button
            for index in 12...23 {
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                cardButtons[index].setTitle("", for: UIControlState.normal)
            }
        }
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
//        if selectedCards.count < 3 {
//            selectedCards.append(newGame.cards)
//        }
        
        if sender.backgroundColor != #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) {
            sender.layer.borderWidth = 3.0
            sender.layer.borderColor = UIColor.blue.cgColor
        }
        let title = sender.title(for: UIControlState.normal)
        sender.setAttributedTitle(colorize(0, title!), for: UIControlState.normal)

    }
    
    private func colorize(_ colorCode: Int = 0, _ symbol: String) -> NSAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : -8.0,
            .strokeColor : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        ]
        return NSAttributedString(string: symbol, attributes: attributes)
    }
    
    
    func deal(_ cards: Int = 0) -> Bool {
        if cards == 0 {
            for index in 0...(cardButtons.count-1) {
                if cardButtons[index].backgroundColor != #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) {
                    let randomCardFromDeck = newGame.cards[(newGame.cards.count-1).arc4random]
//                    switch randomCardFromDeck.number {
//                    case 1:
//                    case 2:
//                    case 3:
//                    default: exit(-1)
//                    }
                    
                    switch randomCardFromDeck.color {
                    case 1: cardButtons[index].backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    case 2: cardButtons[index].backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                    case 3: cardButtons[index].backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    default: exit(-1)
                    }
                    
                    switch randomCardFromDeck.shading {
                    case 1: cardButtons[index].setTitleColor(#colorLiteral(red: 0.4229060016, green: 0.4388156243, blue: 0.770421794, alpha: 1), for: UIControlState.normal)
                    case 2: cardButtons[index].setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: UIControlState.normal)
                    case 3: cardButtons[index].setTitleColor(#colorLiteral(red: 0.7130310959, green: 0.1157009136, blue: 0.770421794, alpha: 1), for: UIControlState.normal)
                    default: exit(-1)
                    }
                    
                    switch randomCardFromDeck.symbol {
                    case 1: cardButtons[index].setTitle("▲", for: UIControlState.normal)
                    case 2: cardButtons[index].setTitle("●", for: UIControlState.normal)
                    case 3: cardButtons[index].setTitle("■", for: UIControlState.normal)
                    default: exit(-1)
                    }
                }
            }
        } else {
            
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
extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

