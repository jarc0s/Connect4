//
//  SplashView.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class SplashView: UIViewController {

    // MARK: Properties
    var presenter: SplashPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SplashView: SplashViewProtocol {
    // TODO: implement view output methods
}
