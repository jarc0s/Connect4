//
//  PlayerRegistrationWireFrame.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class PlayerRegistrationWireFrame: PlayerRegistrationWireFrameProtocol {
  
  class func createPlayerRegistrationModule() -> UIViewController {
    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "PlayerRegistrationView")
    if let view = viewController as? PlayerRegistrationView {
      let presenter: PlayerRegistrationPresenterProtocol & PlayerRegistrationInteractorOutputProtocol = PlayerRegistrationPresenter()
      let interactor: PlayerRegistrationInteractorInputProtocol & PlayerRegistrationRemoteDataManagerOutputProtocol = PlayerRegistrationInteractor()
      let localDataManager: PlayerRegistrationLocalDataManagerInputProtocol = PlayerRegistrationLocalDataManager()
      let remoteDataManager: PlayerRegistrationRemoteDataManagerInputProtocol = PlayerRegistrationRemoteDataManager()
      let wireFrame: PlayerRegistrationWireFrameProtocol = PlayerRegistrationWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      interactor.presenter = presenter
      interactor.localDatamanager = localDataManager
      interactor.remoteDatamanager = remoteDataManager
      remoteDataManager.remoteRequestHandler = interactor
      
      return viewController
    }
    return UIViewController()
  }
  
  static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "PlayerRegistrationView", bundle: Bundle.main)
  }
  
}
