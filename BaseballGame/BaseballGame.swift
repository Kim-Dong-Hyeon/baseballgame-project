//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김동현 on 6/11/24.
//

import Foundation

class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
//        print(answer)
    }
    
    func makeAnswer() -> Int {
        /* 함수 내부를 구현하기 */
        var numbers: [Int] = []
        
        while numbers.count < 3 {
            let number = Int.random(in: 1 ... 9)
            numbers.append(number)
        }
        
        return numbers.reduce(0, { $0 * 10 + $1 })
    }
}
