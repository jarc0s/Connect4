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
  
  
  func makeMovement(column: Int, isPlayer1sTurn: Bool) {
    //Firts Block ALL Buttons from stackViewPlaceHolder
    view?.disableAllButtons(disable: true)
    view?.makePlayerTryToPutChip(column: column)
    view?.updateChipCountForPlayer()
    view?.lightUpChipOn(column: column, alpha: 0.6)
    view?.isPlayerWin()
  }
  
  func validatePlayerAction(result: ResultPlayerAction) {
    if result.correctPlace {
      view?.lightUpChipOn(column: result.position.yPos, alpha: 0.1)
      view?.putChipIn(position: result.position)
    }else {
      debugPrint("Can't place a chip in that column")
    }
  }
  
  func validateVerificationOfWinner(result: Bool) {
    view?.disableAllButtons(disable: false)
    if result {
      view?.showWinner()
    }
    view?.shiftPlayer()
    
  }
  
  func saveGameOnDevice(player: String, chipsPlayer1: Int, chipsPlayer2: Int) {
    game?.winner = player
    game?.chipsPlayer1 = chipsPlayer1
    game?.chipsPlayer2 = chipsPlayer2
    _ = interactor?.saveGameOnDevice(game: game!)
  }
  
  func saveGameOnFireBase(player: String, chipsPlayer1: Int, chipsPlayer2: Int) {
    game?.winner = player
    game?.chipsPlayer1 = chipsPlayer1
    game?.chipsPlayer2 = chipsPlayer2
    interactor?.remoteDatamanager?.writeNewGameToFireBase(game: game!, key: Constants.Defaults.KEY_GAME_CONNECT4, completion: { (result) in
      switch result {
      case .success(_):
        debugPrint("Succes writing on fire base")
      case .failure(_):
        debugPrint("Error on writing on fire base")
      }
    })
  }
  
  func makeNewGame() {
    game?.regDate = "\(Date().millisecondsSince1970)"
    game?.winner = ""
    game?.chipsPlayer1 = 0
    game?.chipsPlayer2 = 0
    getIdGame()
    view?.disableAllButtons(disable: false)
  }
  
  
  //MARK: - Private func
  private func getIdGame() {
    if let game = game {
      view?.setIdGame(idGame: game.regDate)
      view?.configureGame(game: game)
    }
  }
  
  
  
}

extension BoardPresenter: BoardInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
