//
//  Day15.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/29/25.
//

enum Day15 { }

extension Day15 {
    /*
     # ✅ 문제: 조건 이상 합의 최소 부분 배열 길이 (II)

     정수 배열 `nums`와 정수 `target`이 주어졌을 때,
     **합이 target 이상이 되는 연속 부분 배열(subarray)의 가장 짧은 길이**를 구하세요.
     없으면 0을 반환하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 1, 1, 1, 7], target = 7
     Output: 1
     // [7] 만으로도 target 만족
     ```

     ```swift
     Input: nums = [2, 3, 1, 2, 4, 3], target = 8
     Output: 3
     // [4, 3]은 7 → 부족. [2, 4, 3] → 합 9 → 길이 3
     ```

     ```swift
     Input: nums = [1, 2, 3, 4, 5], target = 11
     Output: 3
     // [3, 4, 5] → 합 12
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10⁵
     - 1 <= nums[i] <= 10⁴
     - 1 <= target <= 10⁹
     */
    static func minSubArrayLen(
        _ target: Int,
        _ nums: [Int]
    ) -> Int {
        var left = 0
        var sum = 0
        var minLength = Int.max
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            sum += rightValue
            
            while sum >= target {
                minLength = min(minLength, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}
