//
//  RoundViews.swift
//  Day4SwiftUIViewsandViewModifiers
//
//  Created by Abdulmalik Muhammad on 31/01/2021.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56.0, height: 56.0)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56.0, height: 56.0)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
        
      )
    
  }
}

struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(0.2)
      .bold()
      .font(.title3)
      .frame(width: 68, height: 56)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: 21)
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedViews: View {
  var body: some View {
    VStack(spacing: 5){
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundRectTextView(text: "999")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    RoundedViews()
    RoundedViews()
      .preferredColorScheme(.dark)
  }
}
