//
//  PlayerRegistrationInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationInteractor: PlayerRegistrationInteractorInputProtocol {
  
  // MARK: Properties
  weak var presenter: PlayerRegistrationInteractorOutputProtocol?
  var localDatamanager: PlayerRegistrationLocalDataManagerInputProtocol?
  var remoteDatamanager: PlayerRegistrationRemoteDataManagerInputProtocol?
  
  func writeNewGame(game: Game, key: String) -> Bool {
    return localDatamanager?.writeNewGame(game: game, key: key) ?? false
  }
  
  func writeNewGameToFireBase(game: Game, key: String, completion: @escaping (Result<Bool, Error>) -> Void){
    remoteDatamanager?.writeNewGameToFireBase(game: game, key: key) { result in
      completion(result)
    }
  }
  
}

extension PlayerRegistrationInteractor: PlayerRegistrationRemoteDataManagerOutputProtocol {
  // TODO: Implement use case methods
}
