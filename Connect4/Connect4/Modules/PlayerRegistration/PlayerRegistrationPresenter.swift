//
//  PlayerRegistrationPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationPresenter  {
    
    // MARK: Properties
    weak var view: PlayerRegistrationViewProtocol?
    var interactor: PlayerRegistrationInteractorInputProtocol?
    var wireFrame: PlayerRegistrationWireFrameProtocol?
    
}

extension PlayerRegistrationPresenter: PlayerRegistrationPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension PlayerRegistrationPresenter: PlayerRegistrationInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
