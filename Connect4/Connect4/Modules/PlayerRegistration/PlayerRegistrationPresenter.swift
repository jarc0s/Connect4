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
    
    //Local
    writeToLocal(newGame: newGame)
    
    //FireBase
    //writeToFireBase(newGame: newGame)
  }
  
  private func segueToBoardView(game: Game) {
    wireFrame?.segueToBoardView(from: view!, game: game)
  }
  
  private func writeToLocal(newGame: Game){
    if interactor?.writeNewGame(game: newGame, key: Constants.Defaults.KEY_GAME_CONNECT4) ?? false {
      debugPrint("Game registered with players")
      segueToBoardView(game: newGame)
    }else {
      debugPrint("Error on write new Game")
    }
  }
  
  private func writeToFireBase(newGame: Game){
    interactor?.remoteDatamanager?.writeNewGameToFireBase(game: newGame, key: Constants.Defaults.KEY_GAME_CONNECT4, completion: { [unowned self] (result) in
      switch result {
      case .success(_):
        self.segueToBoardView(game: newGame)
      case .failure(_):
        debugPrint("Error on write new Game")
      }
    })
  }
  
}

extension PlayerRegistrationPresenter: PlayerRegistrationInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
