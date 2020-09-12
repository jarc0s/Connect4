//
//  BoardProtocols.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol BoardViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: BoardPresenterProtocol? { get set }
  func setIdGame (idGame: String)
  func configureGame (game: Game)
  func disableAllButtons (disable: Bool)
  func makePlayerTryToPutChip (column: Int)
  func putChipIn(position: BoardPosition)
  func updateChipCountForPlayer()
  func shiftPlayer()
  func lightUpChipOn(column: Int, alpha: CGFloat)
  func isPlayerWin()
  func showWinner()
}

protocol BoardWireFrameProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createBoardModule() -> UIViewController
  static func createBoardModule(game: Game) -> UIViewController
}

protocol BoardPresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: BoardViewProtocol? { get set }
  var interactor: BoardInteractorInputProtocol? { get set }
  var wireFrame: BoardWireFrameProtocol? { get set }
  var game: Game? { get set }
  
  func viewDidLoad()
  func makeMovement(column: Int, isPlayer1sTurn: Bool)
  func validatePlayerAction(result: ResultPlayerAction)
  func validateVerificationOfWinner(result: Bool)
  func saveGameOnDevice(player: String, chipsPlayer1: Int, chipsPlayer2: Int)
  func saveGameOnFireBase(player: String, chipsPlayer1: Int, chipsPlayer2: Int)
  func makeNewGame()
}

protocol BoardInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}

protocol BoardInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: BoardInteractorOutputProtocol? { get set }
  var localDatamanager: BoardLocalDataManagerInputProtocol? { get set }
  var remoteDatamanager: BoardRemoteDataManagerInputProtocol? { get set }
  func saveGameOnDevice(game: Game) -> Bool
}

protocol BoardDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
}

protocol BoardRemoteDataManagerInputProtocol: class {
  // INTERACTOR -> REMOTEDATAMANAGER
  var remoteRequestHandler: BoardRemoteDataManagerOutputProtocol? { get set }
  func writeNewGameToFireBase(game: Game, key: String, completion: @escaping (Result<Bool, Error>) -> Void)
}

protocol BoardRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
}

protocol BoardLocalDataManagerInputProtocol: class {
  // INTERACTOR -> LOCALDATAMANAGER
  func saveGameOnDevice(game: Game, key: String) -> Bool
  
}
