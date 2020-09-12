//
//  HistoryInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryInteractor: HistoryInteractorInputProtocol {
  
  // MARK: Properties
  weak var presenter: HistoryInteractorOutputProtocol?
  var localDatamanager: HistoryLocalDataManagerInputProtocol?
  var remoteDatamanager: HistoryRemoteDataManagerInputProtocol?
  
  func fetchAllGames() -> [Game]? {
    return localDatamanager?.fetchAllGames(key: Constants.Defaults.KEY_GAME_CONNECT4)
  }
  
}

extension HistoryInteractor: HistoryRemoteDataManagerOutputProtocol {
  // TODO: Implement use case methods
}
