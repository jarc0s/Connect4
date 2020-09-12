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
    //view?.shiftPlayer()
    //view?.disableAllButtons(disable: false)
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
  
  func saveGameOnDevice(player: Player, chipsPlayer1: Int, chipsPlayer2: Int) {
    game?.winner = player
    game?.chipsPlayer1 = chipsPlayer1
    game?.chipsPlayer2 = chipsPlayer2
    _ = interactor?.saveGameOnDevice(game: game!)
  }
  
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
