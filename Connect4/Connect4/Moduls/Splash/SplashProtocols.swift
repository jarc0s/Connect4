//
//  SplashProtocols.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol SplashViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SplashPresenterProtocol? { get set }
}

protocol SplashWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSplashModule() -> UIViewController
}

protocol SplashPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SplashViewProtocol? { get set }
    var interactor: SplashInteractorInputProtocol? { get set }
    var wireFrame: SplashWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SplashInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol SplashInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SplashInteractorOutputProtocol? { get set }
    var localDatamanager: SplashLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SplashRemoteDataManagerInputProtocol? { get set }
}

protocol SplashDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol SplashRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SplashRemoteDataManagerOutputProtocol? { get set }
}

protocol SplashRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SplashLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
