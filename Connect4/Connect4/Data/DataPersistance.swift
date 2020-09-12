//
//  DataPersistance.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import Firebase

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
  
  static func writeGameFireBase(game: Game, key: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    let gameDictionary = game.becomeADictionary()
    var ref: DatabaseReference!
    ref = Database.database().reference()
    ref.child(key).child("\(game.regDate)").setValue(gameDictionary, withCompletionBlock: { error, _ in
      if error == nil {
        completion(.success(true))
      }else {
        completion(.failure(error!))
      }
    })
  }
  
  
  static func fetchAllGamesFromFireBase(key: String, completion: @escaping (Result<[Game], Error>) -> Void){
    var rootRef: DatabaseReference!
    rootRef = Database.database().reference()
    let ref = rootRef.child("\(key)")
    var arrayGame: [Game] = []
    ref.observeSingleEvent(of: .value, with: { snapshot in
      if let objectos2 = snapshot.children.allObjects as? [DataSnapshot] {
        for algos in objectos2 {
          if let cakeDictionary = algos.value as? Dictionary <String, Any> {
            let key = algos.key as String
            var newGame = Game(player1: "", player2: "", regDate: key)
            newGame.player1 = cakeDictionary["player1"] as! String
            newGame.player2 = cakeDictionary["player2"] as! String
            newGame.chipsPlayer1 = cakeDictionary["chipsPlayer1"] as? Int
            newGame.chipsPlayer2 = cakeDictionary["chipsPlayer2"] as? Int
            newGame.winner = cakeDictionary["winner"] as? String
            arrayGame.append(newGame)
          }
        }
        completion(.success(arrayGame))
        return
      }else {
        completion(.failure(ErrorConnect4.errorFetchFromFirebase))
      }
    })
    completion(.failure(ErrorConnect4.errorFetchFromFirebase))
  }
  
  
}
