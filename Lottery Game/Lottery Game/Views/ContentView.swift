//
//  ContentView.swift
//  Lottery Game
//
//  Created by 张惠翔 on 2021/1/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pointsIsVisble = false
    @State private var ruleIsVisble = false
    @State private var noticeIsVisble = false
    @State private var sliderValue = 50.0
    @State private var gameRule = GameRule()
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                TopViews(gameRule: $gameRule)
                    .padding(.bottom, 150.0)
                SliderView(sliderValue: $sliderValue, pointsIsVisble: $pointsIsVisble, gameRule: $gameRule)
                    .padding(.bottom, 200.0)
                InstructionView(ruleIsVisble: $ruleIsVisble, noticeIsVisble: $noticeIsVisble)
            }
        }
    }
}

struct TopViews: View {
    @Binding var gameRule: GameRule
    
    var body: some View {
        VStack {
            TopText(text: "🐱\n猫粮在等着你")
            BigNumberText(text: String(gameRule.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    @Binding var pointsIsVisble: Bool
    @Binding var gameRule: GameRule
    
    var body: some View {
        VStack {
            HStack {
                SliderText(text: "1")
                Slider(value: $sliderValue, in: 1.0...100.0)
                SliderText(text: "100")
            }
            .padding(.bottom, 30.0)
            Button(action: {
                pointsIsVisble = true
            }) {
                CircleButton(text: "Here")
            }
            .alert(isPresented: $pointsIsVisble, content: {
                let roundedValue = Int(sliderValue.rounded())
                return Alert(title: Text("最终得分"), message: Text("你的最终得分是\(gameRule.points(sliderValue: roundedValue))\n" + "100分可获得猫粮噢"), dismissButton:.default(Text("我知道了")))
            })
        }
    }
}

struct InstructionView: View {
    
    @Binding var ruleIsVisble: Bool
    @Binding var noticeIsVisble: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                ruleIsVisble = true
            }) {
                RoundedViewFilledButton(text: "游戏规则", systemName: "gamecontroller.fill", color: Color("LeftButtonColor"))
            }
            .alert(isPresented: $ruleIsVisble, content: {
                return Alert(title: Text("游戏规则"), message: Text("自动生成一个1至100的数字，你可以拖动滑杆，使滑杆所处位置尽可能地靠近随机数字"), dismissButton:.default(Text("我知道了")))
            })
            .padding(.trailing, 50.0)
            Button(action: {
                noticeIsVisble = true
            }) {
                RoundedViewFilledButton(text: "兑奖须知", systemName: "rectangle.fill.on.rectangle.fill", color: Color("RightButtonColor"))
            }
            .alert(isPresented: $noticeIsVisble, content: {
                return Alert(title: Text("游戏规则"), message: Text("获奖可得五份猫粮"), dismissButton:.default(Text("我知道了")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
