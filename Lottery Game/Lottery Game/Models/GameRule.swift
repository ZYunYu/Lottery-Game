//
//  GameRule.swift
//  Lottery Game
//
//  Created by 张惠翔 on 2021/1/12.
//

import Foundation

struct GameRule {
    var target = Int.random(in: 1...100)
    var score = 0
    
    func points(sliderValue: Int) -> Int {
      100 - abs(target - sliderValue)
    }
}




