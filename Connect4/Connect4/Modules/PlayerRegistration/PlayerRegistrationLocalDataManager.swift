//
//  PlayerRegistrationLocalDataManager.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationLocalDataManager:PlayerRegistrationLocalDataManagerInputProtocol {
    
  func writeNewGame(game: Game, key: String) -> Bool {
    return DataPersistance.writeGame(game: game, key: key)
  }
}
