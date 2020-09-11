//
//  HistoryInteractor.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryInteractor: HistoryInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HistoryInteractorOutputProtocol?
    var localDatamanager: HistoryLocalDataManagerInputProtocol?
    var remoteDatamanager: HistoryRemoteDataManagerInputProtocol?

}

extension HistoryInteractor: HistoryRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
