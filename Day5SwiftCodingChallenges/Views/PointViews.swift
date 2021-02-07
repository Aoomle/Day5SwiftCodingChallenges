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
      InstructionText(text: "The slider's value is")
      BigNumber(text: "\(sliderValue)")
      BodyText(text: "You scored \(game.score) points\n 🎉🎉🎉")
      Button(action: {
        alertIsVisble = true
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
