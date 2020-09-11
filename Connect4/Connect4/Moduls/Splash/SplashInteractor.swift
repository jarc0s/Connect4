//
//  SplashInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class SplashInteractor: SplashInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SplashInteractorOutputProtocol?
    var localDatamanager: SplashLocalDataManagerInputProtocol?
    var remoteDatamanager: SplashRemoteDataManagerInputProtocol?

}

extension SplashInteractor: SplashRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
