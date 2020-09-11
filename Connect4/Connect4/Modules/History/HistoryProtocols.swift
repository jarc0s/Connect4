//
//  HistoryProtocols.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

protocol HistoryViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HistoryPresenterProtocol? { get set }
}

protocol HistoryWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHistoryModule() -> UIViewController
}

protocol HistoryPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorInputProtocol? { get set }
    var wireFrame: HistoryWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HistoryInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol HistoryInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HistoryInteractorOutputProtocol? { get set }
    var localDatamanager: HistoryLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HistoryRemoteDataManagerInputProtocol? { get set }
}

protocol HistoryDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HistoryRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HistoryRemoteDataManagerOutputProtocol? { get set }
}

protocol HistoryRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol HistoryLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
