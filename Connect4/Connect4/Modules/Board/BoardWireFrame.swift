//
//  BoardWireFrame.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class BoardWireFrame: BoardWireFrameProtocol {
  
  static func createBoardModule(game: Game) -> UIViewController {
    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BoardView")
    if let view = viewController as? BoardView {
      let presenter: BoardPresenterProtocol & BoardInteractorOutputProtocol = BoardPresenter()
      let interactor: BoardInteractorInputProtocol & BoardRemoteDataManagerOutputProtocol = BoardInteractor()
      let localDataManager: BoardLocalDataManagerInputProtocol = BoardLocalDataManager()
      let remoteDataManager: BoardRemoteDataManagerInputProtocol = BoardRemoteDataManager()
      let wireFrame: BoardWireFrameProtocol = BoardWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      presenter.game = game
      interactor.presenter = presenter
      interactor.localDatamanager = localDataManager
      interactor.remoteDatamanager = remoteDataManager
      remoteDataManager.remoteRequestHandler = interactor
      
      return viewController
    }
    return UIViewController()
  }
  
  class func createBoardModule() -> UIViewController {
    let navController = mainStoryboard.instantiateViewController(withIdentifier: "BoardView")
    if let view = navController.children.first as? BoardView {
      let presenter: BoardPresenterProtocol & BoardInteractorOutputProtocol = BoardPresenter()
      let interactor: BoardInteractorInputProtocol & BoardRemoteDataManagerOutputProtocol = BoardInteractor()
      let localDataManager: BoardLocalDataManagerInputProtocol = BoardLocalDataManager()
      let remoteDataManager: BoardRemoteDataManagerInputProtocol = BoardRemoteDataManager()
      let wireFrame: BoardWireFrameProtocol = BoardWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      interactor.presenter = presenter
      interactor.localDatamanager = localDataManager
      interactor.remoteDatamanager = remoteDataManager
      remoteDataManager.remoteRequestHandler = interactor
      
      return navController
    }
    return UIViewController()
  }
  
  static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "BoardView", bundle: Bundle.main)
  }
  
}
