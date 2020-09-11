//
//  BoardPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class BoardPresenter  {
  
  // MARK: Properties
  weak var view: BoardViewProtocol?
  var interactor: BoardInteractorInputProtocol?
  var wireFrame: BoardWireFrameProtocol?
  var game: Game?
  
}

extension BoardPresenter: BoardPresenterProtocol {
  // TODO: implement presenter methods
  func viewDidLoad() {
    getIdGame()
  }
  
  
  private func getIdGame() {
    if let game = game {
      view?.setIdGame(idGame: game.regDate)
    }
  }
}

extension BoardPresenter: BoardInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
