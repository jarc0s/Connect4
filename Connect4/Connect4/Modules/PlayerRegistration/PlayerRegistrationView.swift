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
  
  @IBOutlet weak var textFieldPlayer1: UITextField!
  @IBOutlet weak var textFieldPlayer2: UITextField!
  
  
  // MARK: Properties
  var presenter: PlayerRegistrationPresenterProtocol?
  
  // MARK: Lifecycle
  @IBAction func startGame(_ sender: UIButton) {
    self.view.endEditing(true)
    let player1Name = textFieldPlayer1.getText()
    let player2Name = textFieldPlayer2.getText()
    
    if !player1Name.isEmpty && !player2Name.isEmpty {
      presenter?.writeNewGameWith(player1: player1Name, player2: player2Name)
    }else {
      debugPrint("Complete the field player's name")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}

extension PlayerRegistrationView: PlayerRegistrationViewProtocol {
  // TODO: implement view output methods
}
