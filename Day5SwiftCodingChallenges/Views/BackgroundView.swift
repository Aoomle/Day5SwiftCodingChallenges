//
//  BackgroundView.swift
//  Day4SwiftUIViewsandViewModifiers
//
//  Created by Abdulmalik Muhammad on 01/02/2021.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
    var body: some View {
      VStack {
        TopView(game: $game)
        Spacer()
        BottomView(game: $game)
      }
      .padding()
      .background(Color("BackgroundColor")
      .edgesIgnoringSafeArea(.all)
      )
    }
}

struct TopView: View {
  @Binding var game: Game
  
    var body: some View {
      HStack {
        Button(action:{
          game.restartGame()
        }){
          RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
        Spacer()
        RoundedImageViewFilled(systemName: "list.dash")
      }
    }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5) {
      LabelText(text: title)
      RoundRectTextView(text: text)
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
    var body: some View {
      HStack {
        NumberView(title: "Score", text: "\(game.score)")
        Spacer()
        NumberView(title: "Round", text: "\(game.round)")
      }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
      BackgroundView(game: .constant(Game()))
    }
}
