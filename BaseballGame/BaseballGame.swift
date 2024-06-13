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
        // 정답 출력
//        print(answer)
        
        print("< 게임을 시작합니다 >")
        
        while true {
            // 1. 유저에게 입력값을 받음
            print("숫자를 입력하세요")
            let input = readLine()!
            var inputArray : [Int] = []
            var sCount = 0, bCount = 0
            
            // 2. 정수로 변환되지 않는 경우 반복문 처음으로 돌아가기
            if Int(input) != nil {
                inputArray = Array(input).map{ Int(String($0))! }
            } else {
                print("올바르지 않은 입력값입니다1\n")
                continue
            }
            
            // 3. 세자리가 아니거나, 0을 가지거나 특정 숫자가 두번 사용된 경우 반복문 처음으로 돌아가기
            if inputArray.count != 3 || inputArray.contains(0) {
                print("올바르지 않은 입력값입니다2\n")
                continue
            } else {
                var isValid = true
                for i in 0 ..< inputArray.count {
                    for j in 0 ..< i {
                        if inputArray[i] == inputArray[j] {
                            print("올바르지 않은 입력값입니다3\n")
                            isValid = false
                            break
                        }
                    }
                    if !isValid {
                        break
                    }
                }
                if !isValid {
                    continue
                }
            }
            
            // 4. 정답과 유저의 입력값을 비교하여 스트라이크/볼을 출력하기
            // 만약 정답이라면 break 호출하여 반복문 탈출
            for index in 0 ... 2 {
                if inputArray[index] == answer[index] {
                    sCount += 1
                } else if answer.contains(inputArray[index]) {
                    bCount += 1
                }
            }
            
            if sCount == 0 && bCount == 0 {
                print("Nothing\n")
                continue
            } else if sCount == 3 {
                print("정답입니다!")
                break
            } else {
                print("\(sCount)스트라이크 \(bCount)볼\n")
            }
        }
    }
    
    func makeAnswer() -> [Int] {
        /* 함수 내부를 구현하기 */
        var answerNumbers: [Int] = []
        var tempNumbers: Set<Int> = []
        
        while tempNumbers.count < 3 {
            let number = Int.random(in: 1 ... 9)
            tempNumbers.insert(number)
        }
        answerNumbers = Array<Int>(tempNumbers)
        
        return answerNumbers
    }
}
