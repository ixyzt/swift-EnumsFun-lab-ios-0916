//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards = [Card]()
    //??returns the size of the current hand
    var size: Int { return self.cards.count }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    //This method should return an optional Card (Card?). It should return the top card from the hand, or nil if the deck is empty. This card should also be removed from the hand.
    func flip() -> Card? {
        if cards.isEmpty {
            return nil
        } else {
            return cards.remove(at: 0)
        }
    }
    
    //??This method should take one parameter, card, of type Card, and add it to the bottom of the hand.
    func give(card: Card) {
        return cards.insert(card, at: 0)
    }
    
    //??This method should take one parameter, card, of type Card, and remove that card from the hand.
    func lose(losecard: Card) {
        for (index,handCard) in cards.enumerated() {
            if losecard.description == handCard.description {
                cards.remove(at: index)
            }
        }
        
        return
    }
    
    
    
    
}
