//
//  TextView.swift
//  Day4SwiftUIViewsandViewModifiers
//
//  Created by Abdulmalik Muhammad on 31/01/2021.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .kerning(2)
      .bold()
      .font(.footnote)
      .lineSpacing(4)
      .multilineTextAlignment(.center)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumber: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .fontWeight(.black)
      .font(.largeTitle)
      .lineSpacing(42.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35.0)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .font(.caption)
  }
}

struct TextView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumber(text: "999")
      SliderLabelText(text: "99")
      LabelText(text: "80")
    }
  }
}
