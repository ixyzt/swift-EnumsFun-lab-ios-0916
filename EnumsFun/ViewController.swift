//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

//They each flip one card over at a time. Whoever has the highest card wins both cards. Cards increase in value from 2 to Ace. Suits don't matter. If the cards are the same value, then each player flips over another card, and also adds a face-down card. Whoever wins takes all the cards. If the face-up cards are again the same value, then this process repeats until one player wins. The game ends when one player runs out of cards.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    //create game
    var game = GameEngine(player1: "Player 1", player2: "Player 2")
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        // Play one turn, compare cards
        // check card values, highest card wins, equal value -> play one turn + add face down card.  Repeat until high card wins.
        if game.gameOver() != true {
            
            
            let gameTurn = game.playOneTurn()
            var gameAwardCards = [Card]()
            
            gameAwardCards.append(gameTurn.1!)
            gameAwardCards.append(gameTurn.2!)
            
            winnerLabel.text = "\(gameTurn.0.name)\n Lives!"
            if let playerCard = gameTurn.1 {
                playerCardLabel.text = String(playerCard.description)
                
            }
            if let opponentCard = gameTurn.2 {
                opponentCardLabel.text = String(opponentCard.description)
            }
            
            if gameTurn.0.name == game.player1.name {
                game.award(cards: gameAwardCards, to: game.player1)
            } else {
                game.award(cards: gameAwardCards, to: game.player2)
            }
            
            playerScoreLabel.text = String(game.player1.hand.cards.count)
            opponentScoreLabel.text = String(game.player2.hand.cards.count)
        }
    }
    
}












