//
//  HistoryPresenter.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

class HistoryPresenter  {
    
    // MARK: Properties
    weak var view: HistoryViewProtocol?
    var interactor: HistoryInteractorInputProtocol?
    var wireFrame: HistoryWireFrameProtocol?
    
}

extension HistoryPresenter: HistoryPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension HistoryPresenter: HistoryInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
