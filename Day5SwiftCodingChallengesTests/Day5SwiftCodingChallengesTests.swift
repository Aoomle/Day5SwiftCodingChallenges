//
//  Day5SwiftCodingChallengesTests.swift
//  Day5SwiftCodingChallengesTests
//
//  Created by Abdulmalik Muhammad on 02/02/2021.
//

import XCTest
@testable import Day5SwiftCodingChallenges

class Day5SwiftCodingChallengesTests: XCTestCase {

 
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testRound() {
    game.startNewRound(points: 100)
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testScoreClose(){
    game.startNewRound(points: 100)
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restartGame()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)
  }

}
