//
//  HistoryRemoteDataManager.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryRemoteDataManager:HistoryRemoteDataManagerInputProtocol {
  
  var remoteRequestHandler: HistoryRemoteDataManagerOutputProtocol?
  
  func fetchAllGamesFromFireBase(key: String, completion: @escaping (Result<[Game], Error>) -> Void) {
    DataPersistance.fetchAllGamesFromFireBase(key: key) { (result) in
      completion(result)
    }
  }
  
  
}
