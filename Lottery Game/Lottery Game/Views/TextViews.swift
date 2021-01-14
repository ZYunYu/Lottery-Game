//
//  TextViews.swift
//  Lottery Game
//
//  Created by 张惠翔 on 2021/1/13.
//

import SwiftUI

struct TopText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .fontWeight(.black)
            .multilineTextAlignment(.center)
            .font(.title)
            .foregroundColor(Color("ButtonTextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("ButtonTextColor"))
    }
}

struct SliderText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("ButtonTextColor"))
    }
}


struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
        TopText(text: "🐱🐱🐱\n猫粮在等着你！！！")
        BigNumberText(text: "100")
        HStack {
            SliderText(text: "1")
            SliderText(text: "100")
        }
    }

  }
}
