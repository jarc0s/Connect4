//
//  BoardView.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class BoardView: UIViewController {
  
  @IBOutlet weak var labelIdGame: UILabel!
  
  var idGame:String = "" {
    didSet{
      DispatchQueue.main.async {
        self.labelIdGame.text = "IdGame:\(self.idGame)"
      }
    }
  }
  // MARK: Properties
  var presenter: BoardPresenterProtocol?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //self.hidesBottomBarWhenPushed = true
//    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
}

extension BoardView: BoardViewProtocol {
  // TODO: implement view output methods
  func setIdGame(idGame: String) {
    self.idGame = idGame
  }
}
