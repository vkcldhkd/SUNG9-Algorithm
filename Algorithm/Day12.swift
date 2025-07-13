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

extension Day12 {
    /*
     # ✅ 문제: 고정 구간 내 연속 짝수 개수의 최댓값

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)**에 대해
     그 구간 내에서 연속으로 등장하는 **짝수의 최댓값**을 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [2, 4, 1, 6, 8, 5]
     let k = 4
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     ```
     (→ 구간 [1,6,8,5] → 짝수 6,8 → 연속 2개)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [1, 3, 5, 7, 2, 4]
     let k = 3
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```
     (→ 구간 [7,2,4] → 짝수 2,4 → 연속 2개)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 2, 4, 6, 8, 1]
     let k = 5
     ```

     ### ✳️ 출력 예시 3
     ```swift
     4
     ```
     (→ 구간 [2,4,6,8,1] → 짝수 2,4,6,8 → 연속 4개)

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func maxConsecutiveEvensInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        func getEvenValue(numbers: [Int]) -> Int {
            var evenValue = 0
            for num in numbers {
                if num % 2 == 0 {
                    evenValue += 1
                } else {
                    evenValue = 0
                }
            }
            return evenValue
        }
        
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
    
        var windowValue = numbers[0 ..< k]
        var maxEvenValue = getEvenValue(numbers: Array(windowValue))
    
        for i in k ..< numbers.count {
            _ = windowValue.removeFirst()
            windowValue.append(numbers[i])
            maxEvenValue = max(maxEvenValue, getEvenValue(numbers: Array(windowValue)))
        }
        
        return maxEvenValue
    }
}

extension Day12 {
    /*
     # ✅ 문제: 고정 구간 내 음수 개수의 최댓값

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)**에 대해
     그 구간 내 음수의 개수 중 **최댓값**을 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [-1, 2, -3, 4, -5, -6]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     ```
     (→ 구간 [-3, 4, -5] → 음수 2개)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [1, 2, 3, -1, -2]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     1
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [-1, -2, -3, -4, -5]
     let k = 4
     ```

     ### ✳️ 출력 예시 3
     ```swift
     4
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     - 음수는 0 미만의 수를 의미함
     */
    
    static func maxNegativeCountInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }

        var currentNegativeCount = numbers[0 ..< k].filter { $0 < 0 }.count
        var maxNegativeCount = currentNegativeCount

        for i in k ..< numbers.count {
            let outNum = numbers[i - k]
            let inNum = numbers[i]
            
            if outNum < 0 {
                currentNegativeCount -= 1
            }
            if inNum < 0 {
                currentNegativeCount += 1
            }
            
            maxNegativeCount = max(maxNegativeCount, currentNegativeCount)
        }

        return maxNegativeCount
    }
}

extension Day12 {
    /*
     # ✅ 문제: 고정 구간 내 짝수 개수의 최솟값

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)**에 대해
     그 구간 내 짝수의 개수 중 **최솟값**을 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     1
     ```
     (→ 구간 [1, 2, 3] 또는 [3, 4, 5] 등에서 짝수 하나)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [2, 4, 6, 8, 10]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```
     (→ 모든 구간이 짝수 2개)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 3, 5, 7]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     0
     ```
     (→ 모두 홀수)

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    static func minEvenCountInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        func isEven(num: Int) -> Bool {
            return num % 2 == 0
        }
        
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        var currentEvenCount = 0
        
        for i in 0 ..< k {
            if isEven(num: numbers[i]) {
                currentEvenCount += 1
            }
        }
        var minEvenCount = currentEvenCount

        for i in k ..< numbers.count {
            if isEven(num: numbers[i-k]) {
                currentEvenCount -= 1
            }
            
            if isEven(num: numbers[i]) {
                currentEvenCount += 1
            }
            
            minEvenCount = min(minEvenCount, currentEvenCount)
        }
        
        return minEvenCount
    }
}

extension Day12 {
    /*
     # ✅ 문제: 고정 구간 내 홀짝 차이의 절댓값 최댓값

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 **모든 연속 부분 배열(subarray)**에 대해
     (짝수 개수 - 홀수 개수)의 **절댓값** 중 최댓값을 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     1
     ```
     (→ 예: [2, 3, 4] → 짝수 2개, 홀수 1개 → |2-1| = 1)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [2, 4, 6, 8, 10]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```
     (→ 모든 구간이 짝수만 있음 → |2-0| = 2)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 3, 5, 7]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     2
     ```
     (→ 모든 구간이 홀수만 있음 → |0-2| = 2)

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func maxAbsEvenOddDiffInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        func isEven(num: Int) -> Bool {
            return num % 2 == 0
        }
        
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        let windowValue = numbers[0 ..< k]
        var currentEvenCount = windowValue.filter { isEven(num: $0) }.count
        var currentOddCount = windowValue.count - currentEvenCount
        var maxDiff = abs(currentEvenCount - currentOddCount)
        
        for i in k ..< numbers.count {
            if isEven(num: numbers[i-k]) {
                currentEvenCount -= 1
            } else {
                currentOddCount -= 1
            }
            
            if isEven(num: numbers[i]) {
                currentEvenCount += 1
            }
            maxDiff = max(maxDiff, abs(currentEvenCount - currentOddCount))
        }
        
        return maxDiff
    }
}

extension Day12 {
    /*
     ✅ 문제: 정수 배열의 균형점 찾기
     하나의 정수 배열이 주어졌을 때, 배열을 왼쪽과 오른쪽으로 나누었을 때
     양쪽 구간의 합이 같은 **"균형점"**이 존재하는지 판단하시오.

     균형점은 인덱스를 기준으로 왼쪽과 오른쪽을 나눈다. 단, 현재 인덱스는 어느 쪽에도 포함되지 않는다.

     ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 7, 3, 6, 5, 6]
     ```
     ✳️ 출력 예시 1
     ```swift
     true
     ```

     ✳️ 입력 예시 2
     ```swift
     let numbers = [1, 2, 3]
     ```
     ✳️ 출력 예시 2
     ```swift
     false
     ```

     ✳️ 입력 예시 3
     ```swift
     let numbers = [2, 1, -1]
     ```
     ✳️ 출력 예시 3
     ```swift
     true
     ```

     ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - 배열의 원소: -100,000 이상 100,000 이하
     - 시간 복잡도는 O(n) 이하로 통과해야 함
     */
    static func hasPivotIndex(_ numbers: [Int]) -> Bool {
        
        guard numbers.count > 1,
              numbers.count <= 100_000 else { return false }
        
        let prefixSum = numbers.reduce(0, +)
        var leftSum = 0
        for i in 0 ..< numbers.count {
            let rightSum = prefixSum - leftSum - numbers[i]
            if leftSum == rightSum {
                print("pivotIndex: \(i)")
                return true
            }
            
            leftSum += numbers[i]
        }
        
        return false
    }
}

extension Day12 {
    /*
     # ✅ 문제:
     정수 배열 A가 주어졌을 때, 배열에 존재하지 않는 가장 작은 양의 정수(1보다 크거나 같은 수) 를 구하는 함수를 작성하세요.

     ---

     ✳️ 예시
     A = [1, 3, 6, 4, 1, 2]
     → 배열에 1, 2, 3, 4, 6이 있음 → 5가 없음
     → 결과: 5

     A = [1, 2, 3]
     → 4가 없음
     → 결과: 4

     A = [-1, -3]
     → 양의 정수가 없음 → 가장 작은 양의 정수는 1
     → 결과: 1

     ---

     ❗️조건
     N: 배열 A의 길이 → 1 이상 100,000 이하
     배열 A의 각 요소는 -1,000,000 이상 1,000,000 이하의 정수
     */
    
    static func missingInteger(
        _ numbers: [Int]
    ) -> Int {
        guard numbers.count > 1,
              numbers.count <= 100_000 else { return 0 }
        
        let numberToSet = Set(numbers)
        var missNumber = 1
        
        while numberToSet.contains(missNumber) {
            missNumber += 1
        }
        
        return missNumber
    }
}
