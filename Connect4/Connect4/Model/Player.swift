//
//  Player.swift
//  Connect4
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

typealias ResultPlayerAction = (correctPlace: Bool, position: (xPos: Int, yPos: Int))
typealias BoardPosition = (xPos: Int, yPos: Int)

struct Player: Codable {
  var name: String
  var chipsPlaced: Int = 0
  var identityValue: Int
  
  init(name: String, identityValue: Int) {
    self.name = name
    self.identityValue = identityValue
  }
}


protocol MakeMovement {
  
  mutating func placeChipOnColumn(column: Int, array: inout [[Int]]) -> ResultPlayerAction//(correctPlace: Bool, position: (xPos: Int, yPos:Int))
  
  func validateWinnerAtPoint(position: BoardPosition, array: [[Int]]) -> Bool
}



extension Player: MakeMovement {
  mutating func placeChipOnColumn(column: Int, array: inout [[Int]]) -> ResultPlayerAction {
    let range = (0..<array.count).reversed()
    var correctPlace = false
    var position: (Int, Int) = (xPos: -1, yPos: -1)
    for index in range {
      if array[index][column] == 0 {
        debugPrint("Chip placed in: [\(index),\(column)]")
        array[index][column] = identityValue
        updateChipUsed(value: identityValue)
        position = (index, column)
        correctPlace.toggle()
        break
      }
    }
    return (correctPlace, position)
  }
  
  func validateWinnerAtPoint(position: (xPos: Int, yPos: Int), array: [[Int]]) -> Bool {
    var existWinner = false
    
    let leftLimit = ( (position.yPos - 3) < 0 ) ? 0 : ( position.yPos - 3 )
    let rightLimit = ((position.yPos + 3) > array[0].count - 1) ? (array[0].count - 1) : (position.yPos + 3)
    let horizontalRange = leftLimit...rightLimit
    
    let horizontalResult = validateHorizontalRow(range: horizontalRange, array: array[position.xPos])
    existWinner = horizontalResult.isWinner
    
    if existWinner {
      return true
    }
    
    let topLimit = ((position.xPos - 3) < 0 ) ? 0 : (position.xPos - 3)
    let bottomLimit = ((position.xPos + 3) > (array.count - 1)) ? array.count - 1 : position.xPos + 3
    let verticalRange = topLimit...bottomLimit
    let verticalResult = validateVerticalRow(range: verticalRange, array: array, column: position.yPos)
    
    existWinner = verticalResult.isWinner
    
    if existWinner {
      return true
    }
    
    let diagonalResult = validateDiagonal(row: position.xPos, column: position.yPos, array: array)
    
    existWinner = diagonalResult.isWinner
    
    if existWinner {
      return true
    }
    
    return false
  }
  
  private func validateHorizontalRow(range: ClosedRange<Int>, array: [Int]) -> (isWinner: Bool, player: Int) {
    
    var sumPoints = 0
    var isWinner = false
    for value in array[range] {
      sumPoints += value
      if abs(sumPoints) == 4 {
        debugPrint("validateHorizontalRow range: \(range)")
        isWinner.toggle()
        break
      }
    }
    return (isWinner, sumPoints)
  }
  
  private func validateVerticalRow(range: ClosedRange<Int>, array:[[Int]], column: Int) -> (isWinner: Bool, player: Int) {
    var sumPoints = 0
    var isWinner = false
    for index in range {
      sumPoints += array[index][column]
      if abs(sumPoints) == 4 {
        debugPrint("validateVerticalRow range: \(range). column: \(column)")
        isWinner = true
        break
      }
    }
    return (isWinner, sumPoints)
  }
  
  private func validateDiagonal(row: Int, column: Int, array:[[Int]]) -> (isWinner: Bool, player: Int){
    
    var sumLeftDiagonal = 0
    var sumRightDiagonal = 0
    var isWinner = false
    var playerWinner = 0
    
    for n in -3...3 {
      if row + n >= 0 && row + n <= array.count - 1 {
        if column + n >= 0 && column + n <= array[0].count - 1 {
          sumLeftDiagonal += array[row + n][column + n]
          if abs(sumLeftDiagonal) == 4 {
            debugPrint("validateDiagonal [\(row + n)][\(column + n)]")
            playerWinner = sumLeftDiagonal
            isWinner = true
            break
          }
        }
      }
      
      if column + n >= 0 && column + n <= array[0].count - 1 {
        if row - n <= array.count - 1 && row - n >= 0 { //1 - -3
          sumRightDiagonal += array[row - n][column + n]
          if abs(sumRightDiagonal) == 4 {
            debugPrint("validateDiagonal [\(row - n)][\(column + n)]")
            isWinner = true
            playerWinner = sumRightDiagonal
            break
          }
        }
      }
    }
    return (isWinner, playerWinner)
  }
  
  mutating func updateChipUsed(value: Int) {
    chipsPlaced += value
  }
  
}
