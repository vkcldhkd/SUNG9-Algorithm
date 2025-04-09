//
//  Day1.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/9/25.
//

import Foundation


enum Day1 { }

extension Day1 {
    /*
     📅 오늘의 문제 (Day 1-1)
     🧩 문제 이름: 숫자의 합
     문제 링크: 백준 11720번 - 숫자의 합

     난이도: 🟢 초급

     주제: 문자열, 반복문, 배열

     💡 설명:
     N개의 숫자가 주어지고, 그 숫자들을 모두 더하는 간단한 문제
     첫째 줄에 숫자의 개수 N (1 ≤ N ≤ 100)이 주어진다. 둘째 줄에 숫자 N개가 공백없이 주어진다.
     */
    static func sumOfDigits() -> (numberLine: Int, sumValue: Int) {
        let numberLine = Int(readLine()!)!
        let numberString = readLine()!
        
        
        let sum = numberString
            .compactMap { Int(String($0)) }
            .reduce(0, +)
        return (numberLine, sum)
    }
}

extension Day1 {
    /*
     📅 오늘의 문제 (Day 1-2)
     🧩 문제 이름: 최댓값
     문제 링크: 백준 2562번 - 최댓값

     난이도: 🟢 초급

     주제: 배열, 조건문, 반복문

     📘 문제 설명:
     9개의 서로 다른 자연수가 주어지면, 그 중에서 가장 큰 값과 그 값이 몇 번째 수인지를 출력하는 문제.
     
     ✅ 요구 사항:
     - 총 9줄 입력 (각 줄에 숫자 1개)
     - 가장 큰 수 출력
     - 몇 번째 수인지 출력 (인덱스는 1부터 시작)
     */
    static func maxValue() -> (maxValue: Int, line: Int)? {
        let lineNumber = 9
        var values: [String] = []
        
        for _ in 0..<lineNumber {
            if let line = readLine() {
                values.append(line)
            }
        }
        
        let intValues = values.compactMap { Int($0) }
        
        guard let maxValue = intValues.max(),
              let index = intValues.firstIndex(of: maxValue) else {
            return nil
        }
        
        return (maxValue, index + 1)
    }
}


extension Day1 {
    /*
     📅 오늘의 문제 (Day 3)
     🧩 문제 이름: OX퀴즈
     문제 링크: 백준 8958번 - OX퀴즈

     난이도: 🟢 초급

     주제: 문자열, 반복문, 조건문

     📘 문제 설명
     OX 퀴즈의 결과가 문자열로 주어짐.
     O는 정답, X는 오답. O가 연속되면 점수가 누적 증가함.

     O 하나당 1점

     연속된 O는 이전 점수 + 1점 (누적)

     X는 0점, 누적은 초기화됨
     */
    
    static func oxQuizScore() -> (testCaseNum: Int, scoreArray: [Int]) {
        var scoreArray: [Int] = []
        let testCaseNum = Int(readLine()!)!
        var caseArray: [String] = []
        
        for _ in 0 ..< testCaseNum {
            caseArray.append(readLine()!)
        }
        
        
        caseArray.forEach { caseString in
            var score = 0
            
            let indexCase = caseString
                .map { String($0) }
                
            var accumulatedScore = 0
            
            for i in 0 ..< indexCase.count {
                let currentChar = indexCase[i]
                
                if currentChar == "O" {
                    score += 1
                    if i > 0 && indexCase[i-1] == "O" {
                        accumulatedScore += 1
                        score += accumulatedScore
                    } else {
                        accumulatedScore = 0
                    }
                }
            }
                
            scoreArray.append(score)
        }

        return (testCaseNum, scoreArray)
    }
}
