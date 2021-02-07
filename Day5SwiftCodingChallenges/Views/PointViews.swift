//
//  PointViews.swift
//  Day5SwiftCodingChallenges
//
//  Created by Abdulmalik Muhammad on 07/02/2021.
//

import SwiftUI

struct PointViews: View {
  @Binding var alertIsVisble: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    
    VStack(spacing: 10){
      let roundValue = Int(sliderValue.rounded())
      let points = game.points(sliderValue: roundValue)
      InstructionText(text: "The slider's value is")
      BigNumber(text: "\(roundValue)")
      BodyText(text: "You scored \(points) points\n 🎉🎉🎉")
      Button(action: {
        alertIsVisble = false
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21.0)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointViews_Previews: PreviewProvider {
  static var previews: some View {
    PointViews(alertIsVisble: .constant(true), sliderValue: .constant(50), game: .constant(Game()))
  }
}
