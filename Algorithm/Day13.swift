//
//  Day13.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/25/25.
//

enum Day13 { }

extension Day13 {
    /*
     # ✅ 문제: Missing Integer
     자연수로 이루어진 배열이 주어질 때, 배열에 존재하지 않는 가장 작은 자연수를 찾아 반환하세요.
     배열에는 중복된 수가 있을 수 있습니다.

     ---

     ### ✳️ 입력 예시
     Input: [1, 3, 6, 4, 1, 2]
     Output: 5

     Input: [1, 2, 3]
     Output: 4

     Input: [-1, -3]
     Output: 1

     ---

     ### ❗️조건
     - 배열의 길이: `1 <= A.count <= 100,000`
     - 각 원소의 범위: `-1,000,000 <= A[i] <= 1,000,000`
     - 시간복잡도는 `O(N)` 또는 `O(N * log N)` 이내로 해결해야 합니다.
     */
    
    static func findMissingPositive(_ numbers: [Int]) -> Int {
        let numberToSet = Set(numbers.filter { $0 > 0 })
        
        var current = 1
        while true {
            if !numberToSet.contains(current) {
                return current
            }
            current += 1
        }
    }
}
