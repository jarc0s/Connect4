//
//  Board.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

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
}
