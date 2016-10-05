//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    var stringValue: String {
        if self.rawValue == 14 {
            return "A"
        } else if self.rawValue == 13 {
            return "K"
        } else if self.rawValue == 12 {
            return "Q"
        } else if self.rawValue == 11 {
            return "J"
        } else {
            return String(self.rawValue)
        }
    }
}

class Card {
    let suit: Suit
    let rank: Rank
    var description: String { return rank.stringValue+suit.rawValue }

    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }

}
