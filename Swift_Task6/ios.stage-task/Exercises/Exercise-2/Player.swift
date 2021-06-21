//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        let cardOnTable = [card]
        return checkHasSameValues(as: cardOnTable)
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        let cardsOnTable = [Card](table.values) + [Card](table.keys)
        return checkHasSameValues(as: cardsOnTable)
    }
    
    func checkHasSameValues(as table: [Card]) -> Bool {
        for cardHand in self.hand! {
            for cardTable in table {
                if cardHand.suit != cardTable.suit && cardHand.value == cardTable.value {
                    return true
                }
            }
        }
        return false
    }
}
