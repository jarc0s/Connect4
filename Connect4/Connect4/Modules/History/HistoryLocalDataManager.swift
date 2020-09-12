//
//  HistoryLocalDataManager.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryLocalDataManager:HistoryLocalDataManagerInputProtocol {
  func fetchAllGames(key: String) -> [Game]? {
    if let gameDictionary = DataPersistance.fetchAllGames(key: key) {
      return gameDictionary.map({ $0.value })
    }
    return nil
  }
}
