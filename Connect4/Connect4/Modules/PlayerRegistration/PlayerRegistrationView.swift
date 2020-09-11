//
//  PlayerRegistrationView.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class PlayerRegistrationView: UIViewController {
  
  // MARK: Properties
  var presenter: PlayerRegistrationPresenterProtocol?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension PlayerRegistrationView: PlayerRegistrationViewProtocol {
  // TODO: implement view output methods
}
