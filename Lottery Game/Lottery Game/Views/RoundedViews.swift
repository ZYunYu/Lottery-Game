//
//  RoundedRecatangle.swift
//  Lottery Game
//
//  Created by 张惠翔 on 2021/1/12.
//

import SwiftUI

struct RoundedViewFilledButton: View {
    var text: String
    var systemName: String
    var color: Color
    
    var body: some View {
        HStack{
            Image(systemName: systemName)
            Text(text)
        }
        .frame(width: 125, height: 50)
        .background(color)
        .foregroundColor(Color("ButtonTextColor"))
        .cornerRadius(32.0)
    }
}

struct CircleButton: View{
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.footnote)
            .fontWeight(.black)
            .foregroundColor(Color("ButtonTextColor"))
            .frame(width: 50, height: 50)
            .overlay(
                Circle()
                    .stroke(Color.orange, lineWidth: 5.0)
            )
    }
}

struct RoundedRecatangle_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            CircleButton(text: "1")
            HStack {
                RoundedViewFilledButton(text: "主页", systemName: "house", color: Color("LeftButtonColor"))
                RoundedViewFilledButton(text: "关于", systemName: "gearshape.fill", color: Color("RightButtonColor"))
            }
            
        }
        HStack {
            RoundedViewFilledButton(text: "主页", systemName: "house", color: Color("LeftButtonColor"))
                .preferredColorScheme(.dark)
            RoundedViewFilledButton(text: "关于", systemName: "gearshape.fill", color: Color("RightButtonColor"))
                .preferredColorScheme(.dark)
        
        }
    }
}
