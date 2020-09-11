//
//  PlayerRegistrationProtocols.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol PlayerRegistrationViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: PlayerRegistrationPresenterProtocol? { get set }
}

protocol PlayerRegistrationWireFrameProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createPlayerRegistrationModule() -> UINavigationController
  func segueToBoardView(from view: PlayerRegistrationViewProtocol, game: Game)
}

protocol PlayerRegistrationPresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: PlayerRegistrationViewProtocol? { get set }
  var interactor: PlayerRegistrationInteractorInputProtocol? { get set }
  var wireFrame: PlayerRegistrationWireFrameProtocol? { get set }
  
  func viewDidLoad()
  func writeNewGameWith(player1: String, player2: String)
}

protocol PlayerRegistrationInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}

protocol PlayerRegistrationInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: PlayerRegistrationInteractorOutputProtocol? { get set }
  var localDatamanager: PlayerRegistrationLocalDataManagerInputProtocol? { get set }
  var remoteDatamanager: PlayerRegistrationRemoteDataManagerInputProtocol? { get set }
  func writeNewGame(game: Game, key: String) -> Bool
}

protocol PlayerRegistrationDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
}

protocol PlayerRegistrationRemoteDataManagerInputProtocol: class {
  // INTERACTOR -> REMOTEDATAMANAGER
  var remoteRequestHandler: PlayerRegistrationRemoteDataManagerOutputProtocol? { get set }
}

protocol PlayerRegistrationRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
}

protocol PlayerRegistrationLocalDataManagerInputProtocol: class {
  // INTERACTOR -> LOCALDATAMANAGER
  func writeNewGame(game: Game, key: String) -> Bool
}
