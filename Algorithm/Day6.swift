//
//  Day6.swift
//  Algorithm
//
//  Created by HYUN SUNG on 5/6/25.
//

enum Day6 { }

extension Day6 {
    /*
     ✅ 문제 1: 피보나치 수
     자연수 N이 주어졌을 때, 피보나치 수열의 N번째 항을 구하시오.
     단, 피보나치 수열은 다음과 같이 정의된다.
     F(0) = 0
     F(1) = 1
     F(n) = F(n-1) + F(n-2) (n ≥ 2)
     🔹 입력 예시
     10
     🔹 출력 예시
     55
     ✅ 조건
     0 <= N <= 90
     재귀로 풀면 시간 초과, DP 방식 필수!
     Top-Down(재귀 + 메모이제이션) 또는 Bottom-Up 둘 다 가능
     */
    
    static func fibonacci() -> Int {
        func createFName(index: Int) -> String {
            return "F\(index)"
        }
        func calculate(dict:[String: Int], index: Int) -> (key: String, value: Int) {
//            F(n) = F(n-1) + F(n-2) (n ≥ 2)
            let firstKey: String = createFName(index: index - 1)
            let secondKey: String = createFName(index: index - 2)
            
            let resultKey: String = createFName(index: index)
            let resultValue = (dict[firstKey] ?? 0) + (dict[secondKey] ?? 0)
            return (resultKey, resultValue)
        }
        
        let input = Int(readLine()!)!
        var dict: [String: Int] = [
            "F0":0,
            "F1":1
        ]
        
        for i in 2 ... input {
            let result = calculate(dict: dict, index: i)
            dict[result.key] = result.value
        }
        print(dict)
//        F(10) = F(9) + F(8)
        return dict[createFName(index: input)] ?? 0
    }
}

extension Day6 {
    /*
     ✅ 문제: 가장 큰 수 만들기
     정수 배열이 주어졌을 때, 배열의 모든 숫자를 문자열로 이어 붙여 가장 큰 수를 만들어 반환하시오.

     ✳️ 입력 예시
     [3, 30, 34, 5, 9]
     ✳️ 출력 예시
     "9534330"
     ❗️조건
     - 숫자는 0 이상 1000 이하
     - 반환값은 문자열로
     - 단, 결과가 "000"과 같이 모두 0일 경우 "0"으로 반환
     */
    
    static func createMaxNumber(array: [Int]) -> String {
        let result = array
            .map { String($0) }
            .sorted { $0 + $1 > $1 + $0 }
            .joined()
        
        return result.first == "0" ? "0" : result
    }
}
