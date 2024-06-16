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

// Lv3
// 정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요

// Lv4
// 프로그램을 시작할 때 안내문구를 보여주세요

import Foundation

class BaseballGame {
    /// start : 프로그램 실행했을때 안내문구에 따른 동작 구현 함수
    func start() {
        while true {
            showMenu()
            
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    playGame()
                case 2:
                    showRecords()
                case 3:
                    print("숫자 야구 게임을 종료합니다.")
                    return
                default:
                    print("올바른 숫자를 입력해주세요!\n")
                }
            } else {
                print("올바른 숫자를 입력해주세요!\n")
            }
        }
    }
    
    /// showMenu : 안내문구 출력 함수
    private func showMenu() {
        print("환영합니다! 원하시는 번호를 입력해주세요")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    }
    
    /// playGame : 메인 메뉴에서 [1. 게임 시작하기]를 입력했을 경우 실행하는 게임 시작 함수
    private func playGame() {
        let answer = makeAnswer() // 정답을 만드는 함수
        // 정답 출력
        print(answer)
        
        print("\n< 게임을 시작합니다 >")
        
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
                print("정답입니다!\n")
                break
            } else if sCount == 0 && bCount == 0 {
                print("Nothing\n")
            } else {
                print("\(sCount)스트라이크 \(bCount)볼\n")
            }
        }
    }
    
    /// isValidInput : 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우를 판단하는 함수
    /// - Parameter input: 사용자의 입력값을 받아오는 파라미터
    /// - Returns: 입력 값 판단 후 Bool형 반환 값
    private func isValidInput(_ input: String) -> Bool {
        let digits = Array(input)
        let uniqueDigits = Set(digits)
        return input.count == 3 && digits[0] != "0" && uniqueDigits.count == digits.count && digits.allSatisfy { $0.isNumber }
    }
    
    /// checkAnswer : 스트라이크와 볼의 개수를 계산하는 함수
    /// - Parameters:
    ///   - answer: 정답을 받아오는 파라미터
    ///   - input: 사용자의 입력값을 받아오는 파라미터
    /// - Returns: 계산한 스트라이크와 볼의 값의 Int형 반환
    private func checkAnswer(_ answer: [Int], _ input: [Int]) -> (Int, Int) {
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
    private func makeAnswer() -> [Int] {
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
    
    /// showRecords : 게임 기록 보기 구현 함수
    private func showRecords() {
        // 게임 기록 보기 기능을 여기에 구현합니다.
        print("< 게임 기록 보기 >")
        // 예: 1번째 게임 : 시도 횟수 - 14
        // 여기에서 게임 기록을 출력합니다.
        print("기록이 없습니다.\n") // 임시 출력
    }
}
