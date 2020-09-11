//
//  HistoryWireFrame.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HistoryWireFrame: HistoryWireFrameProtocol {

    class func createHistoryModule() -> UINavigationController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HistoryView")
        if let view = viewController as? HistoryView {
            let presenter: HistoryPresenterProtocol & HistoryInteractorOutputProtocol = HistoryPresenter()
            let interactor: HistoryInteractorInputProtocol & HistoryRemoteDataManagerOutputProtocol = HistoryInteractor()
            let localDataManager: HistoryLocalDataManagerInputProtocol = HistoryLocalDataManager()
            let remoteDataManager: HistoryRemoteDataManagerInputProtocol = HistoryRemoteDataManager()
            let wireFrame: HistoryWireFrameProtocol = HistoryWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return UINavigationController(rootViewController: viewController)
        }
        return UINavigationController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HistoryView", bundle: Bundle.main)
    }
    
}
