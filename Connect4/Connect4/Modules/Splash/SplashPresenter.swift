//
//  SplashPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class SplashPresenter  {
  
  // MARK: Properties
  weak var view: SplashViewProtocol?
  var interactor: SplashInteractorInputProtocol?
  var wireFrame: SplashWireFrameProtocol?
  
}

extension SplashPresenter: SplashPresenterProtocol {
  // TODO: implement presenter methods
  func viewDidLoad() {
    //Wait 5 Seconds and them change to HomeView
    _ = DataPersistance.deleteAllGames(key: Constants.Defaults.KEY_GAME_CONNECT4)
    DispatchQueue.global(qos: .background).async {
      let second: Double = 1000000
      usleep(useconds_t(1.0 * second))
      debugPrint("Active after 5.0 sec, and doesn't block main")
      DispatchQueue.main.async{
        //do stuff in the main thread here
        debugPrint("Present Home View")
        self.wireFrame?.presentHomeView()
      }
    }
  }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
  // TODO: implement interactor output methods
}
