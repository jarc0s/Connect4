//
//  HistoryPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryPresenter  {
  
  // MARK: Properties
  weak var view: HistoryViewProtocol?
  var interactor: HistoryInteractorInputProtocol?
  var wireFrame: HistoryWireFrameProtocol?
  
}

extension HistoryPresenter: HistoryPresenterProtocol {
  // TODO: implement presenter methods
  func viewDidLoad() {
    view?.configTableView()
  }
  
  func getGameArray() {
    if let gameArray = interactor?.fetchAllGames() {
      view?.updateGameArray(array: gameArray)
    }
  }
  
  func getGameArrayFromFireBase() {
    interactor?.remoteDatamanager?.fetchAllGamesFromFireBase(key: Constants.Defaults.KEY_GAME_CONNECT4, completion: { [unowned self] (result) in
      switch result {
      case .success(let gameArray):
        self.view?.updateGameArray(array: gameArray)
      case .failure(_):
        debugPrint("error on fetch all games from firebase")
      }
    })
  }
  
}

extension HistoryPresenter: HistoryInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
