//
//  Day12.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/13/25.
//

enum Day12 { }

extension Day12 {
    /*
     # ✅ 문제: 고정 구간의 중복 없는 최댓값 개수

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 연속 부분 배열(subarray)마다 **서로 다른 수의 개수**를 구하고,
     그중에서 **최댓값을 반환**하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 1, 3, 4, 2, 3]
     let k = 4
     ```

     ### ✳️ 출력 예시 1
     ```swift
     4
     ```
     (→ [1,2,1,3] → 3개, [2,1,3,4] → 4개 ✅, [1,3,4,2] → 4개, [3,4,2,3] → 3개 → 최댓값은 4)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [1, 1, 1, 1]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     1
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 3
     ```

     ### ✳️ 출력 예시 3
     ```swift
     3
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func maxUniqueCountInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }

        var dict: [Int: Int] = [:]
        var maxUnique = 0

        for i in 0..<k {
            dict[numbers[i], default: 0] += 1
        }
        maxUnique = dict.count

        for i in k..<numbers.count {
            let outNum = numbers[i - k]
            let inNum = numbers[i]

            dict[outNum, default: 0] -= 1
            if dict[outNum] == 0 {
                dict.removeValue(forKey: outNum)
            }

            dict[inNum, default: 0] += 1

            maxUnique = max(maxUnique, dict.count)
        }

        return maxUnique
    }
}

extension Day12 {
    /*
     # ✅ 문제: 고정 구간의 최빈값 (Mode) 개수

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)** 에 대해
     **가장 많이 등장한 숫자의 빈도수**를 구하시오.

     그 중 **최댓값을 반환**하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 2, 3, 1, 2]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     ```
     (→ 가능한 구간 [1,2,2], [2,2,3], [2,3,1], [3,1,2] → 가장 많이 등장한 숫자는 모두 2회 등장)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [4, 4, 4, 4]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     1
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func maxFrequencyInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }

        var dict: [Int: Int] = [:]
        var maxUnique = 0

        for i in 0 ..< k {
            dict[numbers[i], default: 0] += 1
        }
        maxUnique = dict.values.max() ?? 0

        for i in k..<numbers.count {
            let outNum = numbers[i - k]
            let inNum = numbers[i]

            dict[outNum, default: 0] -= 1
            if dict[outNum] == 0 {
                dict.removeValue(forKey: outNum)
            }

            dict[inNum, default: 0] += 1
            maxUnique = max(maxUnique, dict.values.max() ?? 0)
        }

        
        return maxUnique
    }
}

extension Day12 {
    /*
     # ✅ 문제: 고정 구간 내 짝수 홀수 개수 차이의 최댓값

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)** 에 대해
     `짝수 개수 - 홀수 개수`의 차이를 구하시오.

     그 중 **가장 큰 차이를 반환**하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5, 6]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     1
     ```
     (→ 구간 [2,3,4] → 짝수: 2개, 홀수: 1개 → 차이 1)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [2, 4, 6, 1, 3]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```
     (→ 구간 [2,4] 또는 [4,6] → 짝수 2, 홀수 0 → 차이 2)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 1, 1, 1]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     -2
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    static func maxEvenOddDiffInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        func getEvenAndOddCount(numbers: [Int]) -> (Int, Int) {
            let even = numbers.filter { $0 % 2 == 0 }.count
            let odd = numbers.count - even
            return (even, odd)
        }
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
    
        
        let startValue = numbers[0 ..< k]
        let tuple = getEvenAndOddCount(numbers: Array(startValue))
        var evenCount = tuple.0
        var oddCount = tuple.1
        var maxValue = evenCount - oddCount
        
        
        for i in k ..< numbers.count {
            if numbers[i-k] % 2 == 0 {
                evenCount -= 1
            } else {
                oddCount -= 1
            }
            
            if numbers[i] % 2 == 0 {
                evenCount += 1
            } else {
                oddCount += 1
            }
            
            maxValue = max(maxValue, evenCount - oddCount)
        }
        
        return maxValue
    }
}
