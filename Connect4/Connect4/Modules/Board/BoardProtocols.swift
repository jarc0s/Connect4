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
}

protocol BoardInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}

protocol BoardInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: BoardInteractorOutputProtocol? { get set }
  var localDatamanager: BoardLocalDataManagerInputProtocol? { get set }
  var remoteDatamanager: BoardRemoteDataManagerInputProtocol? { get set }
}

protocol BoardDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
}

protocol BoardRemoteDataManagerInputProtocol: class {
  // INTERACTOR -> REMOTEDATAMANAGER
  var remoteRequestHandler: BoardRemoteDataManagerOutputProtocol? { get set }
}

protocol BoardRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
}

protocol BoardLocalDataManagerInputProtocol: class {
  // INTERACTOR -> LOCALDATAMANAGER
}
