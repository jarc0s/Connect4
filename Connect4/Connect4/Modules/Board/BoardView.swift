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
  
  @IBOutlet weak var stackView5: UIStackView!
  @IBOutlet weak var stackView4: UIStackView!
  @IBOutlet weak var stackView3: UIStackView!
  @IBOutlet weak var stackView2: UIStackView!
  @IBOutlet weak var stackView1: UIStackView!
  @IBOutlet weak var stackView0: UIStackView!
  @IBOutlet weak var stackViewPlaceHolder: UIStackView!
  
  @IBOutlet weak var labelPlayer1: UILabel!
  @IBOutlet weak var labelPlayer2: UILabel!
  @IBOutlet weak var labelChips1: UILabel!
  @IBOutlet weak var labelChips2: UILabel!
  @IBOutlet weak var crown1: UIImageView!
  @IBOutlet weak var crown2: UIImageView!
  
  @IBOutlet weak var boardViewP1: UIView!
  @IBOutlet weak var boardViewP2: UIView!
  
  var player1: Player!
  var player2: Player!
  var arrayBoard: [[Int]]!
  var isPlayer1sTurn: Bool! {
    didSet{
      self.updateChipsPlaceHolder()
    }
  }
  
  var idGame:String = "" {
    didSet{
      DispatchQueue.main.async {
        self.labelIdGame.text = "IdGame:\(self.idGame)"
      }
    }
  }
  
  var chipsCount: Int = 0 {
    didSet{
      
      if self.isPlayer1sTurn {
        self.labelChips1.text = "\(abs(self.chipsCount))"
      }else {
        self.labelChips2.text = "\(abs(self.chipsCount))"
      }
      
    }
  }
  
  var currentPosition: BoardPosition!
  
  // MARK: Properties
  var presenter: BoardPresenterProtocol?
  
  // MARK: Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
  }
  
  @IBAction func dropChip(_ sender: UIButton) {
    presenter?.makeMovement(column: sender.tag, isPlayer1sTurn: isPlayer1sTurn)
  }
  
  @objc func action(sender: UIBarButtonItem) {
    presenter?.makeNewGame()
  }
  
}

extension BoardView: BoardViewProtocol {
  
  func setIdGame(idGame: String) {
    self.idGame = idGame
  }
  
  func configureGame(game: Game) {
    
    player1 = Player(name: game.player1, identityValue: PlayerIdentityType.player1.rawValue)
    player2 = Player(name: game.player2, identityValue: PlayerIdentityType.player2.rawValue)
    isPlayer1sTurn = Int.random(in: 1...2) == 1 ? true : false
    labelPlayer1.text = game.player1
    labelPlayer2.text = game.player2
    labelChips1.text = "0"
    labelChips2.text = "0"
    crown1.image = nil
    crown2.image = nil
    boardViewP1.isHidden = false
    boardViewP2.isHidden = false
    arrayBoard = Board.buildBoard()
    self.navigationItem.rightBarButtonItem = nil
    clearBoard()
    
  }
  
  func disableAllButtons(disable: Bool) {
    stackViewPlaceHolder.disableButtonsOnView(disable: disable)
  }
  
  func makePlayerTryToPutChip(column: Int) {
    let resultChipOnPlace = isPlayer1sTurn ? player1.placeChipOnColumn(column: column, array: &arrayBoard) :
      player2.placeChipOnColumn(column: column, array: &arrayBoard)
    
    presenter?.validatePlayerAction(result: resultChipOnPlace)
  }
  
  func putChipIn(position: BoardPosition) {
    currentPosition = position
    let imageName = isPlayer1sTurn ? "chip_red" : "chip_blue"
    let chip = Board.getChipForPlayer(chipColor: imageName)
    let contentView = findStackView(position: position)
    chip.id = "chip"
    
    contentView.addSubview(chip)
    chip.translatesAutoresizingMaskIntoConstraints = false
    chip.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 3).isActive = true
    chip.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
    chip.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3).isActive = true
    chip.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3).isActive = true
  }
  
  func updateChipCountForPlayer() {
    self.chipsCount = isPlayer1sTurn ? player1.chipsPlaced : player2.chipsPlaced
  }
  
  func shiftPlayer() {
    isPlayer1sTurn.toggle()
  }
  
  func lightUpChipOn(column: Int, alpha: CGFloat) {
    if let contentView = stackViewPlaceHolder.view(withId: "content\(column)"),
      let imagePlaceHolder = contentView.view(withId: "placeholder") as? UIImageView {
      imagePlaceHolder.alpha = alpha
    }
  }
  
  func isPlayerWin() {
    let resultWinner = isPlayer1sTurn ? player1.validateWinnerAtPoint(position: currentPosition, array: arrayBoard) :
      player2.validateWinnerAtPoint(position: currentPosition, array: arrayBoard)
    presenter?.validateVerificationOfWinner(result: resultWinner)
  }
  
  func showWinner() {
    stackViewPlaceHolder.disableButtonsOnView(disable: true)
    
    let imageCrown = Board.crownNames().randomElement()!
    
    if isPlayer1sTurn {
      crown1.image = UIImage(named: imageCrown)
      crown1.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
      boardViewP2.isHidden = true
      self.view.layoutIfNeeded()
    }else {
      crown2.image = UIImage(named: imageCrown)
      crown2.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
      boardViewP1.isHidden = true
      self.view.layoutIfNeeded()
    }
    
    let playerName = isPlayer1sTurn ? player1.name : player2.name
    let chipsPlaced = isPlayer1sTurn ? player1.chipsPlaced : abs(player2.chipsPlaced)
    
    presenter?.saveGameOnDevice(player: isPlayer1sTurn ? "P1" : "P2", chipsPlayer1: player1.chipsPlaced, chipsPlayer2: player2.chipsPlaced)
    showAlertViewWinner(title: "¡¡WINNER!!", message: "¡¡The player \"\(playerName)\" win with \(chipsPlaced) chips played!!")
  }
  
}


extension BoardView {
  private func updateChipsPlaceHolder(){
    let imageName = isPlayer1sTurn ? "chip_red" : "chip_blue"
    DispatchQueue.main.async {
      self.stackViewPlaceHolder.subviews.forEach { (parentView) in
        if let imageView = parentView.view(withId: "placeholder") as? UIImageView {
          imageView.image = UIImage(named: imageName)
        }
      }
    }
  }
  
  private func findStackView(position: BoardPosition) -> UIView {
    let viewName = "view\(position.xPos)\(position.yPos)"
    var viewContent: UIView!
    switch position.xPos {
    case 0:
      viewContent = stackView0.view(withId: viewName)
    case 1:
      viewContent = stackView1.view(withId: viewName)
    case 2:
      viewContent = stackView2.view(withId: viewName)
    case 3:
      viewContent = stackView3.view(withId: viewName)
    case 4:
      viewContent = stackView4.view(withId: viewName)
    case 5:
      viewContent = stackView5.view(withId: viewName)
    default:
      break
    }
    return viewContent
  }
  
  private func showAlertViewWinner(title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { [weak self]
      UIAlertAction in
      NSLog("OK Pressed")
      self!.addButtonToReplayAGame()
    }
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
  }
  
  private func addButtonToReplayAGame(){
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.reply, target: self, action: #selector(self.action(sender:)))
  }
  
  
  private func clearBoard(){
    stackView5.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
    stackView4.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
    stackView3.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
    stackView2.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
    stackView1.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
    stackView0.subviews.forEach({ view in
      if let image = view.view(withId: "chip") {
        image.removeFromSuperview()
      }
    })
  }
}
