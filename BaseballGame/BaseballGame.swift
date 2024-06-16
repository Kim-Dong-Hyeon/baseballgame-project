//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by 김동현 on 6/11/24.
//

// Lv1
// 1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다

// Lv2
// 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다

import Foundation

class BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        // 정답 출력
        print(answer)
        
        print("< 게임을 시작합니다 >")
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("숫자를 입력하세요")
            guard let input = readLine(), isValidInput(input) else {
                print("올바르지 않은 입력값입니다\n")
                continue
            }
            
            let inputArray = Array(input).compactMap { Int(String($0)) }
            let (sCount, bCount) = checkAnswer(answer, inputArray)
            
            if sCount == 3 {
                print("정답입니다!")
                break
            } else if sCount == 0 && bCount == 0 {
                print("Nothing\n")
            } else {
                print("\(sCount)스트라이크 \(bCount)볼\n")
            }
        }
    }
    
    /// 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우를 판단하는 함수
    /// - Parameter input: 사용자의 입력값을 받아오는 파라미터
    /// - Returns: 입력 값 판단 후 Bool형 반환 값
    func isValidInput(_ input: String) -> Bool {
        if let number = Int(input), input.count == 3 {
            let digits = Array(input)
            let uniqueDigits = Set(digits)
            return !digits.contains("0") && uniqueDigits.count == digits.count
        }
        return false
    }
    
    /// checkAnswer : 스트라이크와 볼의 개수를 계산하는 함수
    /// - Parameters:
    ///   - answer: 정답을 받아오는 파라미터
    ///   - input: 사용자의 입력값을 받아오는 파라미터
    /// - Returns: 계산한 스트라이크와 볼의 값의 Int형 반환
    func checkAnswer(_ answer: [Int], _ input: [Int]) -> (Int, Int) {
        var sCount = 0, bCount = 0
        
        for (index, value) in input.enumerated() {
            if value == answer[index] {
                sCount += 1
            } else if answer.contains(value) {
                bCount += 1
            }
        }
        
        return (sCount, bCount)
    }
    
    // 정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
    // Lv3
    // 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요
    // 맨 앞자리에 0이 오는 것은 불가능합니다
    // 092 → 불가능
    // 870 → 가능
    // 300 → 불가능
    /// makeAnswer : 정답을 랜덤으로 만드는 함수
    /// - Returns: 정수 배열로 반환
    func makeAnswer() -> [Int] {
        /* 함수 내부를 구현하기 */
        var answerNumbers: [Int] = []
        
        // 첫 번째 숫자는 1~9 사이에서 선택
        let firstNumber = Int.random(in: 1...9)
        answerNumbers.append(firstNumber)
        // 나머지 두 숫자는 0~9 사이에서 선택
        while answerNumbers.count < 3 {
            let number = Int.random(in: 0...9)
            if !answerNumbers.contains(number) {
                answerNumbers.append(number)
            }
        }
        
        return answerNumbers
    }
}
