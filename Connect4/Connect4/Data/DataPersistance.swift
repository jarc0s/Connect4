//
//  DataPersistance.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

struct DataPersistance {
  
  static func writeGame(game: Game, key: String) -> Bool {
    let defaults = UserDefaults.standard
    var dictionaryToUpdate: [String:Game] = [:]
    if let currentDictionary = fetchAllGames(key: key) {
      dictionaryToUpdate = currentDictionary
    }
    dictionaryToUpdate[game.regDate] = game
    
    if let jsonData = try? JSONEncoder().encode(dictionaryToUpdate),
      let jsonString = String(data: jsonData, encoding: .utf8) {
      defaults.set(jsonString, forKey: key)
      return true
    }
    
    return false
  }
  
  static func fetchAllGames(key: String) -> [String:Game]? {
    let defaults = UserDefaults.standard
    let decoder = JSONDecoder()
    if let dataGame = defaults.value(forKey: key) as? String,
      let dataGameJson = dataGame.data(using: .utf8),
      let dictionary = try? decoder.decode([String:Game].self, from: dataGameJson){
      return dictionary
    }
    return nil
  }
  
  static func fetchGameWith(id: String, key: String) -> Game? {
    if let currentDictionary = fetchAllGames(key: key) {
      return currentDictionary[id]
    }
    return nil
  }
  
  static func deleteGame(game: Game, key: String) -> Bool {
    let defaults = UserDefaults.standard
    var dictionaryToUpdate: [String:Game] = [:]
    if let currentDictionary = fetchAllGames(key: key) {
      dictionaryToUpdate = currentDictionary
    }
    
    dictionaryToUpdate.removeValue(forKey: game.regDate)
    
    if let jsonData = try? JSONEncoder().encode(dictionaryToUpdate),
      let jsonString = String(data: jsonData, encoding: .utf8) {
      defaults.set(jsonString, forKey: key)
      return true
    }
    
    return false
  }
  
  static func deleteAllGames(key: String) -> Bool {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: key)
    return true
  }
  
}
