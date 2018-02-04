//
//  Game.swift
//  kata
//
//  Created by Alexandre Coelho on 02/02/2018.
//

import Foundation

class Game {
    
    var rolls:Array<Int> = []
    var currentRoll:Int = 0
    init() {
        
    }
    
    func roll(pins:Int) -> Void{
        rolls.insert(pins, at: currentRoll)
        currentRoll += 1
    }
    
    func score() -> Int {
        var sc:Int = 0
        var frameIndex = 0;
        for _ in 0...9{
            if isStrike(frameIndex: frameIndex){
             sc += 10 + strikeBonus(frameIndex: frameIndex)
                frameIndex += 1
            }else{
                if isSpare(frameIndex: frameIndex){
                    sc += 10 + spareBonus(frameIndex: frameIndex)
                }else{
                    sc += sumOfBallsInFrame(frameIndex: frameIndex)
                }
                frameIndex += 2
            }
        }
        return sc
    }
    fileprivate func isStrike(frameIndex:Int)-> Bool{
        return rolls[frameIndex] == 10
    }
    
    fileprivate func spareBonus(frameIndex:Int) -> Int {
        return rolls[frameIndex+2]
    }
    
    fileprivate func sumOfBallsInFrame(frameIndex:Int) -> Int {
        return rolls[frameIndex] + rolls[frameIndex+1]
    }
    
    fileprivate func strikeBonus(frameIndex:Int) -> Int{
        return  rolls[frameIndex+1] + rolls[frameIndex+2]
    }
    
    fileprivate func isSpare(frameIndex:Int) -> Bool{
        return rolls[frameIndex] + rolls[frameIndex+1] == 10
    }
}
