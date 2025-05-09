//
//  Day7.swift
//  Algorithm
//
//  Created by HYUN SUNG on 5/8/25.
//

import Foundation

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


extension Day7 {
    /*
     ✅ 문제: 가장 흔한 단어 (Most Common Word)
     ❓문제 설명
     문자열 paragraph가 주어지고,
     문장에 등장한 단어 중에서 가장 많이 나온 단어를 찾아라.
     단, **금지된 단어 목록 (banned)**은 제외하고 찾아야 한다.

     📥 입력 예시
     paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
     banned = ["hit"]
     📤 출력 예시
     "ball"
     "hit"은 3번 등장하지만 금지어라 제외되고
     "ball"은 2번 등장 → 가장 흔한 단어가 됨

     🔧 조건
     대소문자는 무시 (전부 소문자로 바꿔야 함)
     문장 부호(쉼표, 마침표 등)는 모두 무시
     단어 단위는 공백 또는 구두점으로 분리
     빈도 수가 같은 경우는 아무거나 반환해도 OK
     */
    static func mostCommonWord(paragraph: String, banned: [String]) -> String {
        let resultParagraph = paragraph
            .lowercased()
            .replacingOccurrences(of: "[^a-zA-Z ]", with: "", options: .regularExpression)
            .components(separatedBy: " ")
            .filter { !$0.isEmpty }
        
        var countDict: [String: Int] = [:]
        for word in resultParagraph {
            if banned.filter ({ $0 == word }).count == 0 {
                countDict[word, default: 0] += 1
            }
        }
        
        print("countDict: \(countDict)")
        return countDict.sorted { $0.value > $1.value}.first?.key ?? ""
    }
}


extension Day7 {
    /*
     ✅ 문제: 올바른 괄호 (Valid Parentheses)
     ❓ 문제 설명
     문자열 s가 주어졌을 때,
     괄호들이 올바르게 짝지어져 있는지 확인하는 함수를 작성하시오.

     📥 입력 예시
     s = "()[]{}"
     📤 출력 예시
     true
     ❗️ 조건
     - s는 (, ), {, }, [, ] 로만 구성되어 있음
     - 올바른 괄호는 다음과 같은 조건을 만족해야 함
     - 열리는 괄호는 반드시 닫히는 괄호로 짝지어져야 함
     - 올바른 순서로 닫혀야 함
     - 중첩 구조도 허용됨
     */
    
    static func isValidParentheses() -> Bool {
        let input = readLine()!.map { String($0) }
        var stackArray: [String] = []

        for str in input {
            switch str {
            case "(", "[", "{":
                stackArray.append(str)
            case ")":
                if stackArray.last == "(" {
                    stackArray.removeLast()
                } else {
                    return false
                }
            case "]":
                if stackArray.last == "[" {
                    stackArray.removeLast()
                } else {
                    return false
                }
            case "}":
                if stackArray.last == "{" {
                    stackArray.removeLast()
                } else {
                    return false
                }
            default:
                continue
            }
        }

        return stackArray.isEmpty
    }
}


extension Day7 {
    /*
     🧠 문제: 후위 표기식 계산기
     설명:
     후위 표기식(Postfix Notation, Reverse Polish Notation)이 주어졌을 때, 그 결과를 계산하는 함수를 작성하시오.
     예를 들어 "2 1 + 3 *"는 ((2 + 1) * 3) = 9가 됩니다.

     🔧 입력 형식
     문자열 배열 tokens가 주어집니다.
     각 요소는 피연산자(정수) 또는 연산자('+', '-', '*', '/') 중 하나입니다.
     let tokens = ["2", "1", "+", "3", "*"]
     
     🎯 출력 형식
     계산 결과를 Int로 반환하세요.
     ⛓️ 제약 사항
     - 나눗셈은 정수 나눗셈이며, 결과의 소수점 이하는 버림 처리합니다.
     - 피연산자 수는 1 이상 10,000 이하입니다.
     */
//    static func evaluatePostfixExpression(_ tokens: [String]) -> Int {
//        func create(array: [String]) -> String {
//            var result: String = ""
//            for i in 0 ..< array.count {
//                let indexToken = array[i]
//                let isNumberToken = indexToken.last?.isNumber == true
//                if isNumberToken {
//                    result = "(\(result)\(indexToken))"
//                    
//                } else {
//                    result.append("(\(indexToken))")
//                }
//            }
//            return result
//        }
//        
//        var tokens = tokens
//        var resultArray: [String] = []
//        
//        print("tokens: \(tokens)")
//        while tokens.count > 0 {
//            if tokens.count == 0 { break }
//            
//            if let index = tokens.firstIndex (where: { $0 == "+" || $0 == "-" || $0 == "*" || $0 == "/" }) {
//                print("index: \(index)")
//                
//                let indexString = tokens[index]
//                tokens[index] = ""
//                var beforeNumber: String = ""
//                var afterNumber: String = ""
//                
//                if resultArray.count == 0 {
//                    beforeNumber = tokens[index-2]
//                    afterNumber = tokens[index-1]
//                    resultArray.append("\(beforeNumber)\(indexString)\(afterNumber)")
//                } else {
//                    beforeNumber = tokens[index-1]
//                    resultArray.append("\(indexString)\(beforeNumber)")
//                }
//                
//                tokens.removeAll { token in
//                    return token == "" || token == beforeNumber || token == afterNumber
//                }
//                print("removedTokens: \(tokens)")
//            }
//            
//        }
//        
//        let createdResult: String = create(array: resultArray)
//        let exp: NSExpression = NSExpression(format: createdResult)
//        return exp.expressionValue(with:nil, context: nil) as? Int ?? 0
//    }
    static func evaluatePostfixExpression(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for token in tokens {
            switch token {
            case "+", "-", "*", "/":
                let b = stack.removeLast()
                let a = stack.removeLast()

                let result: Int
                switch token {
                case "+": result = a + b
                case "-": result = a - b
                case "*": result = a * b
                case "/": result = a / b
                default: fatalError("Invalid operator")
                }

                stack.append(result)

            default:
                if let number = Int(token) {
                    stack.append(number)
                }
            }
        }

        return stack.last ?? 0
    }

}
