//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards = [Card]()
    //Create a new initializer than creates a deck of playing cards. This should be an array of 52 Card instances of the appropriate rank and suit. (Hint: You can use a couple of for loops to do this -- remember how to create Rank and Suit enums from raw values!) Assign this to the cards property. Make sure the deck is shuffled! (Hint: You can call shuffleInPlace() on an Array to shuffle the contents. This method was provided to you.)
    init() {
        for rankValue in 2...15{
            for suitValue in ["♠️", "♦️", "♥️", "♣️"]{
                if let rank = Rank(rawValue: rankValue) {
                    if let suit = Suit(rawValue: suitValue) {
                        cards.append(Card(suit: suit, rank: rank))
                        cards.shuffle()
                    }
                }
            }
        }
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }
}

