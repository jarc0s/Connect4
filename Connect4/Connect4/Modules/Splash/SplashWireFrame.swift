//
//  SplashWireFrame.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class SplashWireFrame: SplashWireFrameProtocol {
  
  func presentHomeView(from view: SplashViewProtocol) {
    let subModules = (
      homeGame: PlayerRegistrationWireFrame.createPlayerRegistrationModule(),
      homeHistory: HistoryWireFrame.createHistoryModule()
    )
    
    let homeTabBarView = HomeWireFrame.createHomeModule(submodules: subModules)
    
    /*if let newView = view as? UIViewController {
      newView.navigationController?.pushViewController(homeTabBarView, animated: true)
    }*/
    
    //let story = UIStoryboard(name: "Main", bundle:nil)
    //let vc = story.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
    UIApplication.shared.windows.first?.rootViewController = homeTabBarView
    UIApplication.shared.windows.first?.makeKeyAndVisible()
    
  }
  
  
  class func createSplashModule() -> UIViewController {
    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SplashView")
    if let view = viewController as? SplashView {
      let presenter: SplashPresenterProtocol & SplashInteractorOutputProtocol = SplashPresenter()
      let interactor: SplashInteractorInputProtocol & SplashRemoteDataManagerOutputProtocol = SplashInteractor()
      let localDataManager: SplashLocalDataManagerInputProtocol = SplashLocalDataManager()
      let remoteDataManager: SplashRemoteDataManagerInputProtocol = SplashRemoteDataManager()
      let wireFrame: SplashWireFrameProtocol = SplashWireFrame()
      
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
    return UIStoryboard(name: "SplashView", bundle: Bundle.main)
  }
  
}
