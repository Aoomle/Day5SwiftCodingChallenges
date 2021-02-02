//
//  ContentView.swift
//  Day4SwiftUIViewsandViewModifiers
//
//  Created by Abdulmalik Muhammad on 31/01/2021.
//

import SwiftUI

struct ContentView: View {
  @State var alertIsVisible = false
  @State var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
     BackgroundView(game: $game)
      VStack {
        InstructionView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMetButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the bulleye as close as you can to")
        .padding([.leading, .trailing], 30)
      BigNumber(text: "\(game.target)")
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitMetButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      alertIsVisible = true
    }) {
      Text("Hit Me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20)
    .background(ZStack {
      Color.blue
      LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
    })
    .foregroundColor(.white)
    .cornerRadius(21.0)
    .overlay(
      RoundedRectangle(cornerRadius: 21)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
    .alert(isPresented: $alertIsVisible, content: {
      let roundValue = Int(sliderValue.rounded())
      return Alert(title: Text("The slider's value is \(roundValue)\n" + "You scored \(game.points(sliderValue: roundValue)) points"), message: Text(""), dismissButton: .default(Text("Awesome!")))
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .previewLayout(.fixed(width: 538, height: 320))
  }
}
