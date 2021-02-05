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
      RingsCircle()
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

struct RingsCircle: View {
  @Environment (\.colorScheme) var colorScheme
  
  var body: some View {
    
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      ForEach(1..<5) { size in
        let size = CGFloat(100 * size)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
              )
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
      BackgroundView(game: .constant(Game()))
    }
}
