//
//  Day11.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/12/25.
//

enum Day11 { }

extension Day11 {
    /*
     # ✅ 문제: 구간 곱의 최댓값

     정수 배열이 주어졌을 때, 연속된 구간의 곱 중에서 최댓값을 구하시오.
     (단, 구간은 하나 이상의 원소로 구성되어야 함)

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [2, 3, -2, 4]
     ```

     ### ✳️ 출력 예시
     ```swift
     6
     ```

     (2 * 3 = 6이 가장 큰 곱)

     ---

     ### ❗️조건
     - 배열의 길이는 1 이상 10,000 이하
     - 각 원소는 -10 이상 10 이하
     - 시간 복잡도는 O(n) 수준으로 작성할 것
     - 음수가 포함되어 있으므로, 단순 곱셈 누적이 아닌 **동적 계획법(DP)** 응용 필요

     ---

     ### 💡 힌트
     - 연속된 구간의 곱을 구하는 과정에서, **최솟값도 같이 저장해야** 함
     - 음수 × 음수 → 양수로 반전되는 특성 이용
     */
    
    static func maxProductSubarray(_ numbers: [Int]) -> Int {
        guard !numbers.isEmpty else { return 0 }

        var maxProduct = numbers[0]
        var currentMax = numbers[0]
        var currentMin = numbers[0]

        for i in 1..<numbers.count {
            let num = numbers[i]

            if num < 0 {
                swap(&currentMax, &currentMin)
            }

            currentMax = max(num, currentMax * num)
            currentMin = min(num, currentMin * num)
            maxProduct = max(maxProduct, currentMax)
        }

        return maxProduct
    }

}

extension Day11 {
    /*
     # ✅ 문제: 회의실 예약 가능 여부

     회의 시간이 정수 배열로 주어질 때, 한 사람이 모든 회의에 참석 가능한지를 확인하시오.
     회의 시간은 [시작, 끝] 쌍의 리스트로 주어지며, 회의가 겹치지 않으면 참석 가능하다고 판단합니다.

     ---

     ### ✳️ 입력 예시
     ```swift
     let meetings = [[0, 30], [5, 10], [15, 20]]
     ```

     ### ✳️ 출력 예시
     ```swift
     false
     ```

     (0~30과 5~10이 겹치므로 동시에 참석 불가)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let meetings = [[7, 10], [2, 4]]
     ```

     ### ✳️ 출력 예시 2
     ```swift
     true
     ```

     ---

     ### ❗️조건
     - 회의 수는 1 이상 10,000 이하
     - 각 회의는 [시작시간, 종료시간] 형태
     - 시간은 0 이상 100,000 이하의 정수
     - 회의 시작시간 < 종료시간 보장됨

     ---

     ### 💡 추천 접근 방법
     - 회의들을 **시작 시간 기준으로 정렬**
     - 앞 회의가 끝나는 시간과 다음 회의의 시작 시간 비교
     */
    
    static func canAttendAllMeetings(_ meetings: [[Int]]) -> Bool {
        let sortedMeetings = meetings.sorted { $0[0] < $1[0] }

        for i in 1 ..< sortedMeetings.count {
            let prevEnd = sortedMeetings[i - 1][1]
            let currentStart = sortedMeetings[i][0]

            if currentStart < prevEnd {
                return false
            }
        }

        return true
    }
}

extension Day11 {
    /*
     # ✅ 문제: 중복 문자 제거

     문자열이 주어졌을 때, **같은 문자가 연속해서 두 번 이상 등장하지 않도록**
     중복된 문자를 제거한 문자열을 반환하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let input = "aaabbbccdaa"
     ```

     ### ✳️ 출력 예시
     ```swift
     "abcda"
     ```

     ---

     ### ❗️조건
     - 입력 문자열 길이는 1 이상 100,000 이하
     - 영문 소문자로만 구성됨
     - 인접한 문자만 중복 제거 대상 (즉, `"ababa"` → `"ababa"` 유지)

     ---

     ### 💡 힌트
     - 문자열을 순회하며 직전 문자와 비교
     - 새 문자일 경우 결과에 추가
     */
    
    static func removeAdjacentDuplicates(_ input: String) -> String {
        var previous: Character?
        var result = ""
        
        for char in input {
            if previous != char {
                result.append(char)
                previous = char
            }
        }
        return result
    }
}

extension Day11 {
    /*
     # ✅ 문제: 제일 가까운 두 수의 차

     정수 배열이 주어질 때, 배열 내에서 **가장 차이가 적은 두 수의 차**를 구하시오.
     (단, 두 수는 서로 다른 인덱스에 있어야 하며, 차이는 절댓값으로 계산합니다.)

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [4, 9, 1, 32, 13]
     ```

     ### ✳️ 출력 예시
     ```swift
     3
     ```

     (4와 1의 차이: 3 → 최소)

     ---

     ### ❗️조건
     - 배열의 길이는 2 이상 100,000 이하
     - 배열의 값은 -1,000,000 이상 1,000,000 이하
     - 시간 복잡도는 O(n log n) 이하로 작성할 것 (정렬 허용)

     ---

     ### 💡 힌트
     - 배열을 정렬한 뒤, 인접한 두 수의 차이만 확인하면 됨
     - 정렬 후 순차 비교로 최소 차이를 갱신
     */
    
    static func minimumDifference(_ numbers: [Int]) -> Int {
        let sortedNumbers = numbers.sorted()
        var minValue = Int.max

        for i in 1..<sortedNumbers.count {
            let diff = sortedNumbers[i] - sortedNumbers[i - 1]
            minValue = min(minValue, diff)
        }

        return minValue
    }
}

extension Day11 {
    /*
     # ✅ 문제: 올바른 괄호
     문자열이 주어졌을 때, 괄호가 올바르게 열리고 닫히는지를 확인하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let input = "()()"
     ```

     ### ✳️ 출력 예시
     ```swift
     true
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let input = "(())()"
     ```

     ### ✳️ 출력 예시 2
     ```swift
     true
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let input = "(()("
     ```

     ### ✳️ 출력 예시 3
     ```swift
     false
     ```

     ---

     ### ❗️조건
     - 문자열은 `(`, `)` 문자만 포함
     - 길이는 1 이상 100,000 이하
     */
    
    static func isValidParentheses(_ input: String) -> Bool {
        var validCount = 0
        
        for char in input {
            if validCount == 0 && char == ")" {
                return false
            }
            
            if char == "(" {
                validCount += 1
            } else if char == ")" {
                validCount -= 1
            }
        }
        return validCount == 0
    }
}

extension Day11 {
    /*
     # ✅ 문제: 삼총사 (Three Sum to Zero)

     정수 배열이 주어졌을 때, **서로 다른 세 명을 골랐을 때 세 수의 합이 0이 되는 경우의 수**를 구하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [-2, 3, 0, 2, -5]
     ```

     ### ✳️ 출력 예시
     ```swift
     2
     ```

     (조합: `[-2, 0, 2]`, `[3, -2, -1]` 등)

     ---

     ### ❗️조건
     - 배열 길이: 3 이상 13 이하
     - 배열의 값은 -1,000 이상 1,000 이하
     - 세 수의 인덱스는 서로 달라야 함
     - 순서는 고려하지 않음
     */
    static func countZeroSumTriplets(_ numbers: [Int]) -> Int {
        guard numbers.count >= 3,
              numbers.count <= 13 else { return 0 }
        
        var count = 0
        for i in 0 ..< numbers.count {
            for j in i+1 ..< numbers.count {
                for k in j+1 ..< numbers.count {
                    if numbers[i] + numbers[j] + numbers[k] == 0 {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
}

extension Day11 {
    /*
     # ✅ 문제: 합이 K가 되는 조합의 개수

     정수 배열이 주어졌을 때, **서로 다른 세 수의 합이 특정 정수 K가 되는 경우의 수**를 구하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let target = 9
     ```

     ### ✳️ 출력 예시
     ```swift
     2
     ```

     (조합: `[1, 3, 5]`, `[2, 3, 4]` → 총 2개)

     ---

     ### ❗️조건
     - 배열 길이: 3 이상 20 이하
     - 배열의 값은 -1,000 이상 1,000 이하
     - target은 -3,000 이상 3,000 이하
     - 세 수의 인덱스는 서로 달라야 함
     - 조합 순서는 고려하지 않음
     */
    
    static func countTripletsThatSumTo(
        _ numbers: [Int],
        _ target: Int
    ) -> Int {
        guard numbers.count >= 3,
              numbers.count <= 20 else { return 0 }
        
        var count = 0
        for i in 0 ..< numbers.count {
            for j in i+1 ..< numbers.count {
                for k in j+1 ..< numbers.count {
                    if numbers[i] + numbers[j] + numbers[k] == target {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
}

extension Day11 {
    /*
     # ✅ 문제: 가장 가까운 두 수의 차이

     정수 배열이 주어졌을 때, **배열 내에서 두 수의 차이가 가장 작은 값을 반환**하시오.

     ---

     ### ✳️ 입력 예시
     ```swift
     let numbers = [4, 9, 1, 32, 13]
     ```

     ### ✳️ 출력 예시
     ```swift
     3
     ```

     (1과 4의 차이가 가장 작음)

     ---

     ### ❗️조건
     - 배열 길이: 2 이상 1000 이하
     - 배열의 값은 -1,000,000 이상 1,000,000 이하
     - 두 수는 서로 달라야 하며, 중복된 숫자는 무시함
     */
    
    static func minimumDifferenceBetweenTwoNumbers(_ numbers: [Int]) -> Int {
        guard numbers.count >= 2,
              numbers.count <= 1000 else { return 0 }
        
        let sortedNumbers = numbers.sorted()
        var minValue = Int.max

        for i in 1..<sortedNumbers.count {
            let diff = sortedNumbers[i] - sortedNumbers[i - 1]
            minValue = min(minValue, diff)
        }

        return minValue
    }
}


extension Day11 {
    /*
     # ✅ 문제: 곱해서 K가 되는 쌍의 개수

     정수 배열과 정수 K가 주어졌을 때, **두 수의 곱이 K가 되는 쌍의 개수**를 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 6]
     let k = 6
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     ```
     (쌍: `[1, 6]`, `[2, 3]`)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [-2, -3, 6, 1, -1]
     let k = 6
     ```

     ### ✳️ 출력 예시 2
     ```swift
     2
     ```
     (쌍: `[-2, -3]`, `[6, 1]`)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [0, 0, 1]
     let k = 0
     ```

     ### ✳️ 출력 예시 3
     ```swift
     1
     ```
     (쌍: `[0, 0]`)

     ---

     ### ❗️조건
     - 배열 길이: 2 이상 1000 이하
     - 배열의 원소는 -1,000,000 이상 1,000,000 이하
     - 정답은 쌍의 개수이며, (a, b)와 (b, a)는 **같은 쌍**으로 간주
     - 같은 인덱스는 사용할 수 없음
     */
    
    static func countPairsWithProductK(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 2,
              numbers.count <= 1000 else { return 0 }
        
        var count = 0
        for i in 0 ..< numbers.count {
            for j in i+1 ..< numbers.count {
                if numbers[i] * numbers[j] == k {
                    count += 1
                }
            }
        }
        return count
    }
}

extension Day11 {
    /*
     # ✅ 문제: 구간 합 구하기 (누적합 기초)

     정수 배열과 여러 개의 구간 쿼리가 주어질 때, 각 구간의 합을 계산하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let queries = [(0, 2), (1, 3), (2, 4)]
     ```

     ### ✳️ 출력 예시 1
     ```swift
     6
     9
     12
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [10, -2, 5, 7, -3]
     let queries = [(0, 4), (1, 2), (3, 4)]
     ```

     ### ✳️ 출력 예시 2
     ```swift
     17
     3
     4
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1]
     let queries = [(0, 0)]
     ```

     ### ✳️ 출력 예시 3
     ```swift
     1
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - 쿼리 개수: 1 이상 10,000 이하
     - 각 쿼리는 (start, end) 인덱스로 주어짐 (0 ≤ start ≤ end < 배열 길이)
     - 음수도 포함될 수 있음
     */
    
    static func rangeSums(
        _ numbers: [Int],
        _ queries: [(Int, Int)]
    ) -> [Int] {
        guard numbers.count >= 1,
              numbers.count <= 100000 else { return [] }
        
        guard queries.count >= 1,
              queries.count <= 10000 else { return [] }
        
        var prefix = [0]
        for num in numbers {
            prefix.append(prefix.last! + num)
        }
        
        var result: [Int] = []
        for (start, end) in queries {
            result.append(prefix[end+1] - prefix[start])
        }
        
        return result
    }
}

extension Day11 {
    /*
     # ✅ 문제: 구간 내 짝수 개수 세기

     정수 배열과 여러 개의 구간 쿼리가 주어질 때, 각 구간에 포함된 **짝수의 개수**를 계산하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5, 6]
     let queries = [(0, 3), (1, 5), (2, 2)]
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     3
     0
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [2, 4, 6, 8]
     let queries = [(0, 3), (1, 2)]
     ```

     ### ✳️ 출력 예시 2
     ```swift
     4
     2
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 3, 5, 7]
     let queries = [(0, 2), (1, 3)]
     ```

     ### ✳️ 출력 예시 3
     ```swift
     0
     0
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - 쿼리 개수: 1 이상 10,000 이하
     - 각 쿼리는 (start, end) 인덱스로 주어짐 (0 ≤ start ≤ end < 배열 길이)
     */
    
    static func countEvenInRanges(
        _ numbers: [Int],
        _ queries: [(Int, Int)]
    ) -> [Int] {
        guard numbers.count >= 1,
              numbers.count <= 100000 else { return [] }
        
        guard queries.count >= 1,
              queries.count <= 10000 else { return [] }
        
        
//        return queries
//            .map { numbers[$0.0...$0.1].filter { $0 % 2 == 0 }.count }
        
        
        // 짝수 여부를 누적합 배열로
        var prefix = [0]
        for num in numbers {
            let isEven = num % 2 == 0 ? 1 : 0
            prefix.append(prefix.last! + isEven)
        }

        // 각 구간에 대한 결과 계산
        var result: [Int] = []
        for (start, end) in queries {
            result.append(prefix[end + 1] - prefix[start])
        }
        return result
    }
}

extension Day11 {
    /*
     # ✅ 문제: 구간 내 특정 숫자의 등장 횟수 세기

     정수 배열과 여러 개의 구간 쿼리, 그리고 찾고자 하는 특정 숫자 X가 주어질 때,
     각 구간에 해당 숫자가 몇 번 등장하는지 계산하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 2, 2, 4, 2]
     let x = 2
     let queries = [(0, 3), (2, 5), (0, 6)]
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     2
     4
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [5, 5, 5, 5, 5]
     let x = 5
     let queries = [(0, 4), (1, 3), (2, 2)]
     ```

     ### ✳️ 출력 예시 2
     ```swift
     5
     3
     1
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 3, 1, 3, 1]
     let x = 2
     let queries = [(0, 4), (1, 2)]
     ```

     ### ✳️ 출력 예시 3
     ```swift
     0
     0
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - 쿼리 개수: 1 이상 10,000 이하
     - X는 -1,000,000 이상 1,000,000 이하
     - 각 쿼리는 (start, end) 인덱스로 주어짐 (0 ≤ start ≤ end < 배열 길이)
     */
    
    static func countTargetInRanges(
        _ numbers: [Int],
        _ x: Int,
        _ queries: [(Int, Int)]
    ) -> [Int] {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return [] }
        
        guard queries.count >= 1,
              queries.count <= 10_000 else { return [] }
        
        guard x >= -1_000_000, x <= 1_000_000 else { return [] }
        
        var prefix = [0]
        for num in numbers {
            let isEven = num == x ? 1 : 0
            prefix.append(prefix.last! + isEven)
        }

        var result: [Int] = []
        for (start, end) in queries {
            result.append(prefix[end + 1] - prefix[start])
        }
        return result
    }
}

extension Day11 {
    /*
     # ✅ 문제: 구간 내 두 숫자의 등장 횟수 비교

     정수 배열과 여러 개의 구간 쿼리, 그리고 두 개의 숫자 A, B가 주어질 때
     각 쿼리마다 주어진 구간 내에서 A가 B보다 많이 등장한 경우의 개수를 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 1, 3, 1, 2, 2]
     let a = 1
     let b = 2
     let queries = [(0, 3), (1, 5), (0, 6)]
     ```

     ### ✳️ 출력 예시 1
     ```swift
     true
     false
     false
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [4, 4, 4, 4]
     let a = 4
     let b = 5
     let queries = [(0, 3), (1, 2)]
     ```

     ### ✳️ 출력 예시 2
     ```swift
     true
     true
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let a = 6
     let b = 3
     let queries = [(0, 4)]
     ```

     ### ✳️ 출력 예시 3
     ```swift
     false
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - 쿼리 개수: 1 이상 10,000 이하
     - 각 쿼리는 (start, end) 인덱스로 주어짐 (0 ≤ start ≤ end < 배열 길이)
     - A, B는 -1,000,000 이상 1,000,000 이하
     */
    
    static func isACountMoreThanB(
        _ numbers: [Int],
        _ a: Int,
        _ b: Int,
        _ queries: [(Int, Int)]
    ) -> [Bool] {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return [] }
        
        guard queries.count >= 1,
              queries.count <= 10_000 else { return [] }
        
        guard a >= -1_000_000, a <= 1_000_000 else { return [] }
        guard b >= -1_000_000, b <= 1_000_000 else { return [] }
        
        var prefixA = [0]
        var prefixB = [0]
        
        for num in numbers {
            let isA = num == a ? 1 : 0
            let isB = num == b ? 1 : 0
            
            prefixA.append(prefixA.last! + isA)
            prefixB.append(prefixB.last! + isB)
        }

        var result: [Bool] = []
        for (start, end) in queries {
            let resultA = prefixA[end + 1] - prefixA[start]
            let resultB = prefixB[end + 1] - prefixB[start]
            result.append(resultA > resultB)
        }
        return result
    }
}

extension Day11 {
    /*
     # ✅ 문제: 고정 길이 구간의 최대 합

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 연속된 부분 배열(subarray) 중 **합이 가장 큰 값**을 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 2
     ```

     ### ✳️ 출력 예시 1
     ```swift
     9
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [5, 4, -1, 7, 8]
     let k = 3
     ```

     ### ✳️ 출력 예시 2
     ```swift
     20
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [-2, -3, -1, -5]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     -4
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func maxSumOfFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        var windowSum = numbers[0 ..< k]
            .reduce(0, +)
        
        var maxSum = windowSum
        
        for i in k ..< numbers.count {
            windowSum += numbers[i] - numbers[i - k]
            maxSum = max(maxSum, windowSum)
        }
        
        return maxSum
    }
}

extension Day11 {
    /*
     # ✅ 문제: 고정 길이 구간의 최대 평균

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 연속된 부분 배열(subarray) 중 평균이 **가장 큰 값**을 구하시오.
     (소수점 아래는 버리지 않고 실수 그대로 반환)

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 12, -5, -6, 50, 3]
     let k = 4
     ```

     ### ✳️ 출력 예시 1
     ```swift
     12.75
     ```

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [5, 5, 5, 5]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     5.0
     ```

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [-1, -12, -5, -6, -50, -3]
     let k = 3
     ```

     ### ✳️ 출력 예시 3
     ```swift
     -6.0
     ```

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     - 정답은 소수점 아래까지 출력 (Double로 반환)
     */
    static func maxAverageOfFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Double {
        
        func toDouble(value: Int, k: Int) -> Double {
            return Double(value) / Double(k)
        }
        
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        var windowSum = numbers[0 ..< k].reduce(0, +)
        var avgSum = toDouble(value: windowSum, k: k)
        for i in k ..< numbers.count {
            windowSum += numbers[i] - numbers[i - k]
            avgSum = max(avgSum, toDouble(value: windowSum, k: k))
        }
        
        return avgSum
    }
}

extension Day11 {
    /*
     # ✅ 문제: 최대값이 등장하는 횟수

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 연속된 부분 배열(subarray)들 중에서
     **가장 큰 합을 갖는 구간이 몇 개 존재하는지** 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 2, 1]
     let k = 2
     ```

     ### ✳️ 출력 예시 1
     ```swift
     1
     ```
     (→ 합이 5인 구간 [2, 3] 하나)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [1, 1, 1, 1]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     3
     ```
     (→ 모두 합 2)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [2, 1, 2, 1, 2]
     let k = 2
     ```

     ### ✳️ 출력 예시 3
     ```swift
     2
     ```
     (→ 합이 3인 구간 [2,1], [1,2])

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    
    static func countMaxSumWindows(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        var windowSum = numbers[0 ..< k].reduce(0, +)
        var result: [Int] = []
        result.append(windowSum)
        
        for i in k ..< numbers.count {
            windowSum += numbers[i] - numbers[i-k]
            result.append(windowSum)
        }
        
        let resultMaxValue = result.max() ?? 0
        return result.filter { $0 == resultMaxValue }.count
    }
}

extension Day11 {
    /*
     # ✅ 문제: 고정 구간 내 최대 홀수 개수

     정수 배열과 정수 K가 주어졌을 때,
     길이가 K인 연속된 부분 배열(subarray) 중에서
     **홀수의 개수가 가장 많은 구간**에서 그 개수를 구하시오.

     ---

     ### ✳️ 입력 예시 1
     ```swift
     let numbers = [1, 2, 3, 4, 5]
     let k = 3
     ```

     ### ✳️ 출력 예시 1
     ```swift
     2
     ```
     (→ [1, 2, 3], [2, 3, 4], [3, 4, 5] 중 [1,2,3]과 [3,4,5] 에서 2개의 홀수)

     ---

     ### ✳️ 입력 예시 2
     ```swift
     let numbers = [2, 4, 6, 8, 10]
     let k = 2
     ```

     ### ✳️ 출력 예시 2
     ```swift
     0
     ```
     (→ 모든 구간이 짝수만 포함)

     ---

     ### ✳️ 입력 예시 3
     ```swift
     let numbers = [1, 3, 5, 7, 9]
     let k = 3
     ```

     ### ✳️ 출력 예시 3
     ```swift
     3
     ```
     (→ 모든 숫자가 홀수 → 모든 구간의 홀수 개수는 3)

     ---

     ### ❗️조건
     - 배열 길이: 1 이상 100,000 이하
     - K: 1 이상 배열 길이 이하
     */
    static func maxOddCountInFixedWindow(
        _ numbers: [Int],
        _ k: Int
    ) -> Int {
        func isOdd(number: Int) -> Bool {
            return number % 2 != 0
        }
        
        func getOddCount(numbers: [Int]) -> Int {
            return numbers.filter { isOdd(number: $0) }.count
        }
        
        guard numbers.count >= 1,
              numbers.count <= 100_000 else { return 0 }
        
        guard k >= 1, k <= numbers.count else { return 0 }
        
        var count = getOddCount(numbers: Array(numbers[0 ..< k]))
        var maxCount = count
        
        for i in k ..< numbers.count {
            if isOdd(number: numbers[i-k]) {
                count -= 1
            }
            
            if isOdd(number: numbers[i]) {
                count += 1
            }
            maxCount = max(maxCount, count)
        }
        
        return maxCount
    }
}
