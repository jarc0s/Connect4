//
//  Connect4Tests.swift
//  Connect4Tests
//
//  Created by Juan Arcos on 11/09/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import XCTest
@testable import Connect4

class Connect4Tests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testBuildBoard6x7() throws {
    let board = Board.buildBoard()
    
    XCTAssert(!board.isEmpty, "Board is empty")
    
    XCTAssert(board.count == 6 && board[0].count == 7, "The board isn't 6 x 7 size")
    
    let boardSumAllElemts = board.flatMap{ $0 }.reduce(0, +)
    
    XCTAssert(boardSumAllElemts == 0, "Not all elements are Zero")
    
  }
  
  func testPlayerMovement() throws {
    var board = Board.buildBoard()
    
    var player1 = Player(name: "Player 1", identityValue: PlayerIdentityType.player1.rawValue)
    
    XCTAssert(player1.identityValue == 1, "player 1's identity value is not 1")
    
    XCTAssert(player1.chipsPlaced == 0, "the player has already placed a chip")
    
    //Firts Movement
    let resultPlacingAChip = player1.placeChipOnColumn(column: 5, array: &board)
    
    
    XCTAssert(resultPlacingAChip.correctPlace, "The chip cannot be placed in the desired column (5)")
    
    XCTAssert(resultPlacingAChip.position.xPos == 5 && resultPlacingAChip.position.yPos == 5, "the location of the chip on the board isn't (5,5)")
    
    XCTAssert(player1.chipsPlaced == 1, "the player has already placed more than one chip")
    
    let isWinner = player1.validateWinnerAtPoint(position: resultPlacingAChip.position, array: board)
    
    XCTAssert(!isWinner, "the player won on the first play")
    
  }
  
  func testDataPersistance() throws {
    
    let keyDataPersistance = Constants.Defaults.KEY_GAME_CONNECT4_TEST
    
    let player1 = Player(name: "Player 1", identityValue: PlayerIdentityType.player1.rawValue)
    
    let player2 = Player(name: "Player 2", identityValue: PlayerIdentityType.player2.rawValue)
    
    var newGame = Game(player1: player1.name, player2: player2.name, regDate: "\(Date().millisecondsSince1970)")
    
    var allPreviusGames = DataPersistance.fetchAllGames(key: keyDataPersistance)
    
    XCTAssertNil(allPreviusGames, "there are already some registered games")
    
    //Register Firts game
    DataPersistance.writeGame(game: newGame, key: keyDataPersistance)
    allPreviusGames = DataPersistance.fetchAllGames(key: keyDataPersistance)
    
    XCTAssertNotNil(allPreviusGames, "there are no registered games")
    
    var fetchNewGame = DataPersistance.fetchGameWith(id: newGame.regDate, key: keyDataPersistance)
    
    XCTAssertNotNil(fetchNewGame, "there are no registered game with key: \(newGame.regDate)")
    
    XCTAssertNil(fetchNewGame?.winner, "already have a win in this game")
    
    newGame.winner = player1
    newGame.chipsUsedToWin = 10
    
    //Update newGame register
    DataPersistance.writeGame(game: newGame, key: keyDataPersistance)
    
    fetchNewGame = DataPersistance.fetchGameWith(id: newGame.regDate, key: keyDataPersistance)
    
    XCTAssertEqual(fetchNewGame?.winner?.name, player1.name, "player 1 is not the winner")
    XCTAssertNotNil(newGame.winner, "there is no win in this game")
    XCTAssertNotNil(newGame.chipsUsedToWin, "there are no registered chips in the game")
    
    XCTAssertEqual(fetchNewGame?.chipsUsedToWin, newGame.chipsUsedToWin, "they are not the same amount of chips after updating")
    
    //Delete game from data persistance
    
    DataPersistance.deleteGame(game: newGame, key: keyDataPersistance)
    
    fetchNewGame = DataPersistance.fetchGameWith(id: newGame.regDate, key: keyDataPersistance)
    
    XCTAssertNil(fetchNewGame, "there is a game with the key: \(newGame.regDate)")
    
    DataPersistance.deleteAllGames(key: keyDataPersistance)
    
    allPreviusGames = DataPersistance.fetchAllGames(key: keyDataPersistance)
    
    XCTAssertNil(allPreviusGames, "there are several games with the key: \(keyDataPersistance)")
    
  }
  
  
}
