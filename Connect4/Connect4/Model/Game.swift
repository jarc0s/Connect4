//
//  Game.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

struct Game: Codable, CustomStringConvertible {
  
  
  var player1: String
  var player2: String
  var chipsPlayer1: Int?
  var chipsPlayer2: Int?
  var winner: Player?
  var regDate: String 
  
  var description: String {
    return "player1: \(player1), player2: \(player2), regDate: \(Date(milliseconds: Int64(Int(regDate)!)))"
  }
  
}
