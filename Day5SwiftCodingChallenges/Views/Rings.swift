//
//  Rings.swift
//  Day5SwiftCodingChallenges
//
//  Created by Abdulmalik Muhammad on 04/02/2021.
//

import SwiftUI

struct Rings: View {
  var body: some View {
    
    ZStack {
      ForEach(1..<5) { size in
        let size = CGFloat(100 * size)
        Circle()
          .stroke(Color("ButtonStrokeColor"), lineWidth: 20.0)
          .frame(width: size, height: size)
          
     
          
      }
    }
  }
}

struct Rings_Previews: PreviewProvider {
  static var previews: some View {
    Rings()
  }
}
