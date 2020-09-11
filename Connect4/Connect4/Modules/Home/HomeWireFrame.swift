//
//  HomeWireFrame.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
  
  typealias Submodules = (
    homeGame: UIViewController,
    homeHistory: UIViewController
  )
  
  class func createHomeModule(submodules: HomeWireFrame.Submodules) -> UITabBarController {
    
    let tabs = HomeWireFrame.tabs(usingSubModules: submodules)
    let tabViewController = HomeView(tabs: tabs)
    
    let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
    let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
    let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
    let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
    let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
    
    tabViewController.presenter = presenter
    presenter.view = tabViewController
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
    interactor.remoteDatamanager = remoteDataManager
    
    return tabViewController
    
  }
  
  class func createHomeModule() -> UIViewController {
    let navController = mainStoryboard.instantiateViewController(withIdentifier: "HomeView")
    if let view = navController.children.first as? HomeView {
      let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
      let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
      let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
      let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
      let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
      
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
    return UIStoryboard(name: "HomeView", bundle: Bundle.main)
  }
  
}

extension HomeWireFrame {
  static func tabs(usingSubModules submodules: Submodules) -> Connect4ListTabs {
    submodules.homeGame.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "gamecontroller"), tag: 11)
    submodules.homeHistory.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "list.bullet"), tag: 12)
    return (
      homeGame: submodules.homeGame,
      homeHistory: submodules.homeHistory
    )
  }
}
