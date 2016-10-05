//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck = Deck()
    
    
    // Create an initializer for GameEngine that takes two Player parameters called player1 and player2, both of type String, representing the names of the game's players. This initializer should create a deck of cards and split it in half, then create two Player instances and assign them to the appropriate property.
    init(player1: String, player2: String){
        let hands = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: hands.0))
        self.player2 = Player(name: player2, hand: Hand(cards: hands.1))
    }
    
    
    //Implement a method called playOneTurn() that returns a three-element tuple of type (Player, Card?, Card?), representing the winning player of this turn, the card that player1 flipped over, and the card that player2 flipped over. This method should flip cards for each player. Remember, the player with the highest card wins!
    func playOneTurn()->(Player,Card?,Card?){
        if let card1 = player1.flip() {
            if let card2 = player2.flip() {
                if card1.rank.rawValue > card2.rank.rawValue {
                    return (player1, card1, card2)
                } else {
                    return (player2, card1, card2)
                }
            } else {
                return (player1, card1, nil)
            }
        } else if let card2 = player2.flip() {
            return (player2, nil, nil)
        }
        return(player1, nil, nil)
    }
    
    //Implement a method called award(cards:to:). This methods first parameter is called cards of type [Card]. The second parameter should be called player of type player. It should give the player all of the cards. (Hint: Don't forget about the give(card:) method you implemented on the Player class.)
    func award(cards: [Card], to player: Player){
        for card in cards {
            player.give(card: card)
        }
    }
    
    // Implement a method called gameOver() that returns true when the game is over. (The game is over when either player has run out of cards.)
    func gameOver()->Bool{
        if player1.hand.cards.isEmpty {
            return true
        } else if player2.hand.cards.isEmpty {
            return true
        }
        return false
    }
}
