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
