//
//  PlayerRegistrationPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationPresenter  {
  
  // MARK: Properties
  weak var view: PlayerRegistrationViewProtocol?
  var interactor: PlayerRegistrationInteractorInputProtocol?
  var wireFrame: PlayerRegistrationWireFrameProtocol?
  
}

extension PlayerRegistrationPresenter: PlayerRegistrationPresenterProtocol {
  // TODO: implement presenter methods
  func viewDidLoad() {
    
  }
  
  func writeNewGameWith(player1: String, player2: String) {
    let newGame = Game(player1: player1, player2: player2, regDate: "\(Date().millisecondsSince1970)")
    if interactor?.writeNewGame(game: newGame, key: Constants.Defaults.KEY_GAME_CONNECT4) ?? false {
      debugPrint("Game registered with players")
      segueToBoardView(game: newGame)
    }else {
      debugPrint("Error on write new Game")
    }
  }
  
  private func segueToBoardView(game: Game) {
    wireFrame?.segueToBoardView(from: view!, game: game)
  }
  
}

extension PlayerRegistrationPresenter: PlayerRegistrationInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
