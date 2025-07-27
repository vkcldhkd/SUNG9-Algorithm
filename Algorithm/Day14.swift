//
//  Day14.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/27/25.
//

enum Day14 { }

extension Day14 {
    /*
     # ✅ 문제: Number of Subarrays with Product Less Than K

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **곱(product)이 `k`보다 작은 모든 연속 부분 배열(subarray)의 개수**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [10, 5, 2, 6], k = 100
     Output: 8
     // 가능한 구간: [10], [5], [2], [6], [10,5], [5,2], [2,6], [5,2,6]
     ```

     ```swift
     Input: nums = [1, 2, 3], k = 0
     Output: 0
     // 어떤 곱도 0보다 작을 수 없음
     ```

     ```swift
     Input: nums = [1, 1, 1], k = 2
     Output: 6
     // 모든 부분 구간이 곱 < 2 만족
     ```

     ---

     ### ❗️조건

     - 배열 길이: `1 <= nums.count <= 3 × 10^4`
     - 원소 값: `1 <= nums[i] <= 1000`
     - `0 <= k <= 10^6`
     - 시간복잡도는 `O(N)` 또는 `O(N log N)` 이내여야 합니다.
     */
    
    static func numSubarrayProductLessThanK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        
        guard k > 0 else { return 0 }
        var count = 0
        var left = 0
        var windowValue = 1
        
        for right in 0 ..< nums.count {
            windowValue *= nums[right]
            
            while windowValue >= k && left <= right {
                windowValue /= nums[left]
                left += 1
            }
            
            count += (right - left + 1)
        }
        
        return count
    }
}
