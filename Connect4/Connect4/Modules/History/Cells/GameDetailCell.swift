//
//  GameDetailCell.swift
//  Connect4
//
//  Created by Juan Arcos on 12/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

class GameDetailCell: UITableViewCell
{
  
  @IBOutlet private weak var imageWinnerP1: UIImageView!
  @IBOutlet private weak var imageWinnerP2: UIImageView!
  @IBOutlet private weak var labelNameP1: UILabel!
  @IBOutlet private weak var labelNameP2: UILabel!
  @IBOutlet private weak var labelChipsP1: UILabel!
  @IBOutlet private weak var labelChipsP2: UILabel!
  @IBOutlet private weak var backView: UIView!
  @IBOutlet private weak var bottomLineP1: UIView!
  @IBOutlet private weak var bottomLineP2: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backView.layer.cornerRadius = 6
    backView.layer.masksToBounds = true
    backView.layer.shadowColor = UIColor.black.cgColor
    backView.layer.shadowRadius = 20
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageWinnerP1.image = nil
    imageWinnerP2.image = nil
  }
  
  var game: Game? {
    didSet{
      if let game = game{
        labelNameP1.text = game.player1
        labelNameP2.text = game.player2
        labelChipsP1.text = "\(abs(game.chipsPlayer1 ?? 0))"
        labelChipsP2.text = "\(abs(game.chipsPlayer2 ?? 0))"
        let crownName = Board.crownNames().randomElement()!
        let imageCrown = UIImage(named: crownName)
        if game.winner == "P1" {
          imageWinnerP1.image = imageCrown
          bottomLineP2.isHidden = true
          bottomLineP1.isHidden = false
        }else if game.winner == "P2" {
          imageWinnerP2.image = imageCrown
          bottomLineP1.isHidden = true
          bottomLineP2.isHidden = false
        }else {
          bottomLineP1.isHidden = true
          bottomLineP2.isHidden = true
        }
      }
    }
  }
}
