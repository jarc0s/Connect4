//
//  HistoryView.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class HistoryView: UIViewController {

    // MARK: Properties
    var presenter: HistoryPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HistoryView: HistoryViewProtocol {
    // TODO: implement view output methods
}
