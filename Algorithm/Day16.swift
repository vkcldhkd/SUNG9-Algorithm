//
//  Day16.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/30/25.
//

enum Day16 { }

extension Day16 {
    /*
     # ✅ 문제: 정확히 합이 k인 부분 배열의 개수

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 정확히 `k`가 되는 연속 부분 배열(subarray)**의 개수를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```
     Input: nums = [1, 1, 1], k = 2
     Output: 2
     // 가능한 부분 배열: [1,1] (index 0~1), [1,1] (index 1~2)
     ```

     ```
     Input: nums = [1, 2, 3], k = 3
     Output: 2
     // 가능한 부분 배열: [3], [1,2]
     ```

     ```
     Input: nums = [3, 4, 7, -2, 2, 1, 4], k = 7
     Output: 4
     // 가능한 부분 배열: [3, 4], [7], [4, 3], [2, 1, 4]
     ```

     ---

     ### ❗️조건

     - 1 ≤ nums.count ≤ 100,000
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁹ ≤ k ≤ 10⁹
     */
    static func countSubarraysWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var sum = 0
        var freqDict: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            sum += num
            result += freqDict[sum - k, default: 0]
            freqDict[sum, default: 0] += 1
        }
        
        return result
    }
}


extension Day16 {
    /*
     # ✅ 문제: 특정 구간 합이 짝수인 부분 배열의 개수

     정수로 이루어진 배열 `nums`가 주어졌을 때, 연속된 부분 배열(subarray) 중 합이 **짝수인** 부분 배열의 개수를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [1, 2, 3, 4]
     ```

     ## ✳️ 출력 예시
     ```swift
     3
     ```

     - 가능한 부분 배열은: [1, 2, 3, 4], [2], [4]
     - 위 배열들의 합은 각각 10, 2, 4로 모두 짝수
     - 정답: **3**

     ---

     ## ❗️조건
     - 배열 길이: 1 ≤ nums.count ≤ 100,000
     - 각 요소: -10⁴ ≤ nums[i] ≤ 10⁴
     - 시간복잡도: O(n)
     */
    
    static func countEvenSumSubarrays(_ nums: [Int]) -> Int {
        var sum = 0
        var count: [Int: Int] = [0: 1]  // sum % 2 값의 빈도수
        var result = 0
        
        for num in nums {
            sum += num
            let mod = sum % 2
            result += count[mod, default: 0]
            count[mod, default: 0] += 1
        }
        
        return result
    }
}
