//
//  Game.swift
//  Day2SwiiftUIData
//
//  Created by Abdulmalik Muhammad on 29/01/2021.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    let difference = sliderValue > target ? sliderValue - target : target - sliderValue
    let awardedPoints = 100 - difference

    return awardedPoints
  }
}
