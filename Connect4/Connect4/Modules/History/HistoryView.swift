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
  
  @IBOutlet weak var tableView: UITableView!
  
  var gameArray: [Game] = [Game]() {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  // MARK: Properties
  var presenter: HistoryPresenterProtocol?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
    presenter?.getGameArray()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  
  
}

extension HistoryView: HistoryViewProtocol {
  // TODO: implement view output methods
  func configTableView() {
    self.tableView.rowHeight = UITableView.automaticDimension
    self.tableView.estimatedRowHeight = 90
  }
  
  func updateGameArray(array: [Game]) {
    self.gameArray = array
  }
}


extension HistoryView: UITableViewDelegate {
  
}

extension HistoryView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gameArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "gameDetailCell", for: indexPath) as! GameDetailCell
    
    cell.game = gameArray[indexPath.row]
    
    return cell
  }
  
  
}
