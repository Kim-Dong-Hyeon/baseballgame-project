//
//  RecordManager.swift
//  BaseballGame
//
//  Created by 김동현 on 6/16/24.
//

import Foundation

class RecordManager {
    private var records: [Int] = []
    
    /// add : 게임 기록을 저장하는 함수
    /// - Parameter trialCount: 시도 횟수를 받아오는 파라미터
    func add(trialCount: Int) {
        records.append(trialCount)
    }
    
    /// showRecords : 기록을 출력하는 함수
    func showRecords() {
        print("< 게임 기록 보기 >")
        if records.isEmpty {
            print("기록이 없습니다.\n")
        } else {
            for (index, record) in records.enumerated() {
                print("\(index + 1)번째 게임 : 시도 횟수 - \(record)")
            }
            print("")
        }
    }
}
