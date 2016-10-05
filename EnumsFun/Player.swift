//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var hand: Hand
    
    
    //This initializer should set the equivalent properties.
    init(name: String, hand: Hand) {
        self.name = name
        self.hand = hand
    }
    
    // that returns a Bool indicating if the player has cards left in their hand or not.
    func hasCards() -> Bool {
        return hand.cards.isEmpty == false
    }
    
    //If the player has cards, it should return the top card of their hand; otherwise, it should return nil.
    func flip() -> Card? {
        switch self.hasCards() == true {
        case true:
        return self.hand.cards.remove(at: self.hand.cards.count - 1)
        case false:
            return nil
        }
    }
    
    //??This method should take one parameter, card, of type Card, and add it to the bottom of the hand.
    func give(card: Card) {
        return hand.cards.insert(card, at: 0)
    }
    
    //??This method should take one parameter, card, of type Card, and remove that card from the hand.
    func lose(card lostCard: Card){
        for (index, handCard) in hand.cards.enumerated() {
            if handCard.description == lostCard.description {
                hand.cards.remove(at: index)
            }
        }
    }
    
}
