//
//  HomeView.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

typealias Connect4ListTabs = (
  homeGame: UIViewController,
  homeHistory: UIViewController
)

class HomeView: UITabBarController {
  
  // MARK: Properties
  var presenter: HomePresenterProtocol?
  
  init(tabs: Connect4ListTabs){
    super.init(nibName: nil, bundle: nil)
    viewControllers = [tabs.homeGame, tabs.homeHistory]
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension HomeView: HomeViewProtocol {
  // TODO: implement view output methods
}
