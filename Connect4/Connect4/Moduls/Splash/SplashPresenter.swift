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
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
