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
