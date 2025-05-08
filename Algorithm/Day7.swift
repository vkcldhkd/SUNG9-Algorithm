//
//  Day7.swift
//  Algorithm
//
//  Created by HYUN SUNG on 5/8/25.
//

enum Day7 { }

extension Day7 {
    /*
     ✅ 문제: [삽입 가능한 문자 정렬 (Reorder Log Files)]
     로그 문자열 배열이 주어질 때, 아래 조건에 따라 정렬하시오:

     ❗️ 조건
     각 로그는 "식별자 내용"의 형태로 구성된다 (예: "dig1 8 1 5 1").
     내용이 숫자로 시작하면 → 숫자 로그
     내용이 문자로 시작하면 → 문자 로그

     정렬 기준은 다음과 같다:
     - 문자 로그가 숫자 로그보다 항상 먼저 와야 함
     - 문자 로그는 사전순으로 정렬, 내용이 같으면 식별자 기준
     - 숫자 로그는 입력 순서 그대로 유지

     ✅ 입력 예시
     [
      "dig1 8 1 5 1",
      "let1 art can",
      "dig2 3 6",
      "let2 own kit dig",
      "let3 art zero"
     ]
     ✅ 출력 예시
     [
      "let1 art can",
      "let3 art zero",
      "let2 own kit dig",
      "dig1 8 1 5 1",
      "dig2 3 6"
     ]
     */
    static func sortLogsByRule(logs: [String]) -> [String] {
        var stringLogs: [String] = []
        var numberLogs: [String] = []
        
        logs.forEach { log in
            let parts = log.split(separator: " ", maxSplits: 1)
            let content = parts[1]
            let isNumberLog = content.first?.isNumber == true
            
            isNumberLog ? numberLogs.append(log) : stringLogs.append(log)
        }

        stringLogs = stringLogs.sorted {
            let lhsParts = $0.split(separator: " ", maxSplits: 1)
            let rhsParts = $1.split(separator: " ", maxSplits: 1)

            let lhsContent = lhsParts[1]
            let rhsContent = rhsParts[1]

            if lhsContent == rhsContent {
                return lhsParts[0] < rhsParts[0] // 식별자 비교
            } else {
                return lhsContent < rhsContent // 내용 비교
            }
        }
        return stringLogs + numberLogs
    }
}
