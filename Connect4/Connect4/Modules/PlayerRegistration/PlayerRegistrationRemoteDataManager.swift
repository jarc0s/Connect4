//
//  PlayerRegistrationRemoteDataManager.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationRemoteDataManager:PlayerRegistrationRemoteDataManagerInputProtocol {
  
  var remoteRequestHandler: PlayerRegistrationRemoteDataManagerOutputProtocol?
  
  func writeNewGameToFireBase(game: Game, key: String, completion: @escaping (Result<Bool, Error>) -> Void) {
    DataPersistance.writeGameFireBase(game: game, key: key) { (result) in
      completion(result)
    }
  }
}
