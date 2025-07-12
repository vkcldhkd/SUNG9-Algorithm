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
