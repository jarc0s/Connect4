//
//  HomeProtocols.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
  // PRESENTER -> VIEW
  var presenter: HomePresenterProtocol? { get set }
}

protocol HomeWireFrameProtocol: class {
  // PRESENTER -> WIREFRAME
  static func createHomeModule() -> UIViewController
  static func createHomeModule(submodules: HomeWireFrame.Submodules)  -> UITabBarController
}

protocol HomePresenterProtocol: class {
  // VIEW -> PRESENTER
  var view: HomeViewProtocol? { get set }
  var interactor: HomeInteractorInputProtocol? { get set }
  var wireFrame: HomeWireFrameProtocol? { get set }
  
  func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: class {
  // PRESENTER -> INTERACTOR
  var presenter: HomeInteractorOutputProtocol? { get set }
  var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
  var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
}

protocol HomeDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
  // INTERACTOR -> REMOTEDATAMANAGER
  var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
}

protocol HomeRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
}

protocol HomeLocalDataManagerInputProtocol: class {
  // INTERACTOR -> LOCALDATAMANAGER
}
