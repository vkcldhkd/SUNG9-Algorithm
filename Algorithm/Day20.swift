//
//  Day20.swift
//  Algorithm
//
//  Created by HYUN SUNG on 8/3/25.
//

enum Day20 {
    /*
     # ✅ 문제: 합이 `k` 이하인 가장 긴 연속 부분 배열의 길이 구하기

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 `k` 이하인 가장 긴 연속 부분 배열(subarray)** 의 **길이**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     - 부분 배열: `[1, 2]` (합 = 3)

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [2, 1, 1, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```

     - 부분 배열: `[1, 1, 1]` (합 = 3)

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 1, 2, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 3
     ```swift
     2
     ```

     - 부분 배열: `[3]` 또는 `[1, 2]`

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁵ ≤ k ≤ 10⁵
     */
//    static func maxLengthSubarrayWithSumAtMostK(
//        _ nums: [Int],
//        _ k: Int
//    ) -> Int {
//        var left = 0
//        var prefixSum = 0
//        var maxLength = 0
//        
//        for (right, num) in nums.enumerated() {
//            prefixSum += num
//            
//            while prefixSum > k {
//                prefixSum -= nums[left]
//                left += 1
//            }
//            
//            maxLength = max(maxLength, right - left + 1)
//        }
//        
//        return maxLength
//    }
    static func maxLengthSubarrayWithSumAtMostK(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var prefixSum = 0
        var prefixSums: [Int] = [0]  // prefixSums[i] = sum of first i nums
        for num in nums {
            prefixSum += num
            prefixSums.append(prefixSum)
        }

        var deque: [Int] = []
        var maxLength = 0

        for i in 0...n {
            // 조건 위반하는 오래된 인덱스 제거
            while let first = deque.first, prefixSums[i] - prefixSums[first] > k {
                deque.removeFirst()
            }

            // 조건 만족 시 길이 갱신
            if let first = deque.first {
                maxLength = max(maxLength, i - first)
            }

            // 불필요한 인덱스 제거 (뒤쪽 값이 더 크거나 같으면 pop)
            while let last = deque.last, prefixSums[i] <= prefixSums[last] {
                deque.removeLast()
            }

            deque.append(i)
        }

        return maxLength
    }

}
