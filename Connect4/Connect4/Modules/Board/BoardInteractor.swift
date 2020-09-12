//
//  BoardInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class BoardInteractor: BoardInteractorInputProtocol {
  
  // MARK: Properties
  weak var presenter: BoardInteractorOutputProtocol?
  var localDatamanager: BoardLocalDataManagerInputProtocol?
  var remoteDatamanager: BoardRemoteDataManagerInputProtocol?
  
  func saveGameOnDevice(game: Game) -> Bool {
    return localDatamanager?.saveGameOnDevice(game: game, key: Constants.Defaults.KEY_GAME_CONNECT4) ?? false
  }
  
}

extension BoardInteractor: BoardRemoteDataManagerOutputProtocol {
  // TODO: Implement use case methods
}
