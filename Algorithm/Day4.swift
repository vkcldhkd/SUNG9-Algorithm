//
//  Day4.swift
//  Algorithm
//
//  Created by HYUN SUNG on 4/22/25.
//

enum Day4 { }

extension Day4 {
    /*
     🧩 문제: 숫자 문자열과 영단어
     ✅ 설명
     아래와 같이 숫자를 나타내는 영단어가 포함된 문자열이 주어질 때,
     이를 숫자로 바꿔서 반환하는 함수를 만들어라.

     단어    숫자
     zero    0
     one    1
     two    2
     three    3
     four    4
     five    5
     six    6
     seven    7
     eight    8
     nine    9
     
     ✅ 입력 예시
     let s = "one4seveneight"
     
     ✅ 출력 예시
     "1478"
     */
    
    static func convertToDigit() -> String {
        var result: String = readLine()!
        let numberMap: [String: String] = [
            "zero": "0",
            "one": "1",
            "two": "2",
            "three": "3",
            "four": "4",
            "five": "5",
            "six": "6",
            "seven": "7",
            "eight": "8",
            "nine": "9"
        ]
        
        numberMap.forEach {
            result = result.replacingOccurrences(of: $0.key, with: $0.value)
        }
        
        return result
    }
}

extension Day4 {
    /*
     🧩 문제: 신규 아이디 추천 (카카오 기출 변형)
     ✅ 설명
     아이디 입력값이 주어질 때, 아래 조건에 맞게 아이디를 추천해주는 로직을 작성하시오.

     ✅ 처리 조건 (순서대로 적용해야 함)
     1) 모든 대문자를 소문자로 변환
     2) 알파벳 소문자, 숫자, -, _, . 만 허용.
     → 그 외 문자는 제거
     3) .이 2번 이상 연속되면 하나로 치환
     4) .이 처음이나 끝에 있다면 제거
     5) 빈 문자열이라면 "a"를 대입
     6) 길이가 16자 이상이면, 첫 15자만 남기고 나머지 제거
     → 끝에 .이 남으면 제거
     7) 길이가 2자 이하라면, 마지막 문자를 반복해서 3자가 될 때까지 붙임

     ✅ 입력 예시
     let id = "...User__Name--..!!"
     ✅ 출력 예시
     "user.name"
     */
    
    static func recommendID() -> String {
        var result: String = readLine()!
        
        // MARK: - 1
        result = result.lowercased()
        
        // MARK: - 2
        result = result.replacingOccurrences(
            of: "[^0-9a-z-_.]",
            with: "",
            options: .regularExpression
        )

        
        // MARK: - 3
        while result.contains("..") {
            if !result.contains("..") { break }
            result = result.replacingOccurrences(of: "..", with: ".")
        }
        
        
        // MARK: - 4
        if result.hasPrefix(".") {
            result.remove(at: result.startIndex)
        }
        
        if result.hasSuffix(".") {
            result.removeLast()
        }
        
        // MARK: - 5
        if result.isEmpty {
            result = "a"
        }
        
        // MARK: - 6
        if result.count >= 16 {
            result = String(result.prefix(15))
            if result.hasSuffix(".") {
                result.removeLast()
            }
        }
        
        // MARK: - 7
        if result.count <= 2 {
            let count = result.count
            for _ in 0 ..< (3 - count) {
                result += String(result.last!)
            }
        }
        
        return result
    }
}


extension Day4 {
    /*
     🧩 문제: 가장 많이 등장한 문자 찾기
     ✅ 설명
     영어 소문자로만 이루어진 문자열이 주어졌을 때,
     가장 많이 등장한 문자를 찾아 반환하세요.
     (동점이 있을 경우, 알파벳 순으로 앞선 문자를 반환)

     ✅ 입력 예시
     let input = "helloapplebanana"
     
     ✅ 출력 예시
     a
     
     "a": 4번 등장
     "l": 3번 등장
     "e": 2번 등장 …
     */
    
    static func mostFrequentCharacter() -> String {
        let input: String = readLine()!
        
        let charArray = input
            .map { $0 }
            .sorted()
        
        var countDict: [String: Int] = [:]
        
        Set(charArray).forEach { char in
            let count = charArray.filter { $0 == char }.count
            countDict[String(char)] = count
        }
        /*
         아래의 코드로 더 간단하게 개선 가능
         for char in input {
             countDict[char, default: 0] += 1
         }
         */
        
        return countDict
            .sorted { $0.value > $1.value || ($0.value == $1.value && $0.key < $1.key) }
            .first!
            .key
    }
}
