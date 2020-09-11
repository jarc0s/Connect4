//
//  PlayerRegistrationInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class PlayerRegistrationInteractor: PlayerRegistrationInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: PlayerRegistrationInteractorOutputProtocol?
    var localDatamanager: PlayerRegistrationLocalDataManagerInputProtocol?
    var remoteDatamanager: PlayerRegistrationRemoteDataManagerInputProtocol?

}

extension PlayerRegistrationInteractor: PlayerRegistrationRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
