//
//  BowlingGameTest.swift
//  Tests
//
//  Created by Alexandre Coelho on 02/02/2018.
//

import XCTest

class BowlingGameTest: XCTestCase {
    
    var g:Game!
    
    override func setUp() {
        super.setUp()
        self.g = Game()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func rollMany(n:Int, pins:Int){
        for _ in 0...(n-1) {
        
            g.roll(pins: pins)
        }
    }
    
    func testGutterGame(){
        self.rollMany(n: 20, pins: 0)
        XCTAssertEqual(0, g.score())
    }
    
    func testAllOnes(){
        self.rollMany(n: 20, pins: 1)
        print("score :", g.score())
        XCTAssertEqual(20, g.score())
    }
    
    func testOneSpare(){
        rollSpare()
        g.roll(pins: 3)
        rollMany(n: 17, pins: 0)
        print("score :", g.score())
        XCTAssertEqual(16, g.score())
    }
    
    func testOneStrike(){
        g.roll(pins: 10) // strike
        g.roll(pins: 3)
        g.roll(pins: 4)
        rollMany(n: 17, pins: 0)
        XCTAssertEqual(24, g.score())
    }
    
    
    func rollSpare() -> Void{
        g.roll(pins: 5)
        g.roll(pins: 5) // spare
    }
 
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
