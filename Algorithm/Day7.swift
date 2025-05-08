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


extension Day7 {
    /*
     ✅ 문제: 유효한 팰린드롬 2 (Valid Palindrome II)
     ❓ 문제 설명
     문자열 s가 주어졌을 때, 최대 한 글자만 삭제해서 해당 문자열을 팰린드롬으로 만들 수 있는지 판단하시오.

     ✅ 팰린드롬(Palindrome)?
     앞에서 읽든 뒤에서 읽든 같은 문자열
     예: "abba", "racecar", "a", "noon"

     📥 입력 예시
     "abca"
     📤 출력 예시
     true
     "abca"는 'b'를 제거하면 "aca" → 팰린드롬이 됨!

     ❗️조건
     - 문자열 길이 최대 10⁵
     - 오직 영문 소문자로만 구성
     - 시간복잡도 O(n) 수준으로 해결해야 함
     - 투 포인터로 앞뒤 비교하면서 진행
     - 최대 한 번만 삭제 허용
     */
    static func validPalindrome() -> Bool {
        func isValid(
            _ chars: [Character],
            left: Int,
            right: Int,
            canDelete: Bool
        ) -> Bool {
            var l = left
            var r = right

            while l < r {
                if chars[l] == chars[r] {
                    l += 1
                    r -= 1
                } else {
                    if !canDelete {
                        return false
                    }
                    return isValid(chars, left: l + 1, right: r, canDelete: false)
                        || isValid(chars, left: l, right: r - 1, canDelete: false)
                }
            }
            return true
        }
        
        let input = Array(readLine()!)
        return isValid(input, left: 0, right: input.count - 1, canDelete: true)
        
        
//        var input = readLine()!
//        var removeCount: Int = 0
//        while input.count > 1 {
//            print(input)
//            if input.first == input.last {
//                input.removeFirst()
//                input.removeLast()
//                print("removed: \(input)")
//            } else {
//                guard removeCount <= 1 else { break }
//                
//                if input.count == 2 {
//                    input.removeFirst()
//                    removeCount += 1
//                } else {
//                    let inputToArray = Array(input)
//                    if inputToArray[1] == inputToArray.last {
//                        input.removeFirst()
//                        removeCount += 1
//                    } else if inputToArray.first == inputToArray[inputToArray.count - 2] {
//                        input.removeLast()
//                        removeCount += 1
//                    } else {
//                        break
//                    }
//                }
//            }
//        }
//        print("result: \(input)")
//        print("removeCount: \(removeCount)")
//        return input.count <= 1 && removeCount <= 1
    }
}
