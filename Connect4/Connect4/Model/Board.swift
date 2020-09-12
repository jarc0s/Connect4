//
//  Board.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation
import UIKit

struct Board {
  
  static func buildBoard() -> [[Int]] {
    return [
      buildZeroArray(with: 7),
      buildZeroArray(with: 7),
      buildZeroArray(with: 7),
      buildZeroArray(with: 7),
      buildZeroArray(with: 7),
      buildZeroArray(with: 7)
    ]
  }
  
  static func buildZeroArray(with size:Int) -> [Int] {
    return [Int](repeating: 0, count: size)
  }
  
  static func getChipForPlayer(chipColor: String) -> UIImageView {
    let chip = UIImageView(frame: CGRect.zero)
    chip.image = UIImage(named: chipColor)
    chip.contentMode = .scaleAspectFit
    return chip
  }
  
  static func crownNames() -> [String] {
    return [
      "crown_01_a",
      "crown_02_a",
      "crown_03_a",
      "crown_04_a",
      "crown_05_a",
      "crown_06_a"
    ]
  }
}
