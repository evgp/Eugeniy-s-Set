//
//  ViewController.swift
//  Eugeniy's Set
//
//  Created by Evgeniy Polyarush on 19/05/2018.
//  Copyright © 2018 Evgeniy Polyarush. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    enum symbol: Int {
//        case triangle, square, circle
//        func value() -> Character {
//            switch self {
//            case .triangle: return "▲"
//            case .circle: return "●"
//            case .square: return "■"
//            }
//        }
//    }
//
//    enum background: Int {
//        case first, second, third
//        func value() -> UIColor {
//            switch self {
//            case .first: return UIColor(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
//            case .second: return UIColor(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
//            case .third: return UIColor(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
//            }
//        }
//    }
    
    private var newGame = gameSet()
    private var selectedCards = [Card]()
    
    @IBOutlet var cardButtons: [UIButton]! {
        didSet {
            //deal cards per button
            for index in 12...23 {
                let button = cardButtons[index]
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                button.setTitle("", for: UIControlState.normal)
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
//        let title = sender.title(for: UIControlState.normal)
//        sender.setAttributedTitle(colorize(0, title!), for: UIControlState.normal)

    }
    
    private func numberize(by color: UIColor, _ symbol: String) -> NSAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : -8.0,
            .strokeColor : color
        ]
        return NSAttributedString(string: symbol, attributes: attributes)
    }
    private var distinguisherSymbol = "▲●■"
    private var distinguisherShading = [#colorLiteral(red: 0.4229060016, green: 0.4388156243, blue: 0.770421794, alpha: 1),#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1),#colorLiteral(red: 0.7130310959, green: 0.1157009136, blue: 0.770421794, alpha: 1)]
    private var distinguisherBackground = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1),#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)]
    private var distinguisherNumber = [#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)]              //stroke
    
    func deal(_ cards: Int = 0) -> Bool {
        if cards == 0 {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                if button.backgroundColor != #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) {
                    let randomCardFromDeck = newGame.cards[(newGame.cards.count-1).random]
//                    switch randomCardFromDeck.number {
//                    case 1: button.setAttributedTitle({ colorize(randomCardFromDeck.number, distinguisherSymbol[randomCardFromDeck.symbol]) }, for: UIControlState.normal)
//                    case 2:
//                    case 3:
//                    default: exit(-1)
//                    }
                    
                    switch randomCardFromDeck.color {
                    case 1: button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                    case 2: button.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                    case 3: button.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    default: exit(-1)
                    }
                    
                    switch randomCardFromDeck.shading {
                    case 1: button.setTitleColor(#colorLiteral(red: 0.4229060016, green: 0.4388156243, blue: 0.770421794, alpha: 1), for: UIControlState.normal)
                    case 2: button.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: UIControlState.normal)
                    case 3: button.setTitleColor(#colorLiteral(red: 0.7130310959, green: 0.1157009136, blue: 0.770421794, alpha: 1), for: UIControlState.normal)
                    default: exit(-1)
                    }
                    
                    switch randomCardFromDeck.symbol {
                    case 1: button.setTitle("▲", for: UIControlState.normal)
                    case 2: button.setTitle("●", for: UIControlState.normal)
                    case 3: button.setTitle("■", for: UIControlState.normal)
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
    var random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
    var background: UIColor {
        switch self {
        case 1: return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 2: return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case 3: return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        default: return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    var shading: UIColor {
        switch self {
        case 1: return UIColor(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 2: return UIColor(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        case 3: return UIColor(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        default: return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
    
    var symbol: String {
        switch self {
        case 1: return "▲"
        case 2: return"●"
        case 3: return"■"
        default: return "n/a"
        }
    }
    
}

