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

extension Day20 {
    /*
     ✅ 문제: 동일한 숫자가 k번 이상 등장하는 가장 짧은 부분 배열 길이
     정수 배열 nums와 정수 k가 주어졌을 때,
     배열에서 어떤 숫자가 정확히 k번 이상 등장하는 가장 짧은 연속 부분 배열의 길이를 구하세요.
     해당하는 부분 배열이 없다면 0을 반환하세요.

     ✳️ 입력 예시 1
     let nums = [1, 2, 2, 3, 1]
     let k = 2
     
     ✳️ 출력 예시 1
     3
     부분 배열: [2, 2, 3] 또는 [3, 1, 2] (중복 최소 길이 = 3)

     ✳️ 입력 예시 2
     let nums = [1, 1, 1, 1]
     let k = 3
     
     ✳️ 출력 예시 2
     3
     부분 배열: [1, 1, 1]

     ✳️ 입력 예시 3
     let nums = [1, 2, 3]
     let k = 2
     
     ✳️ 출력 예시 3
     0
     어떤 수든 2번 이상 등장하지 않음

     ❗️조건
     1 ≤ nums.count ≤ 10⁵

     -10⁴ ≤ nums[i] ≤ 10⁴

     1 ≤ k ≤ 10⁵


     */
    static func minLengthSubarrayWithElementAtLeastKCount(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var countMap: [Int: Int] = [:]
        var minLength = Int.max

        for right in 0 ..< nums.count {
            countMap[nums[right], default: 0] += 1

            while countMap.values.contains(where: { $0 >= k }) {
                minLength = min(minLength, right - left + 1)
                countMap[nums[left], default: 0] -= 1
                if countMap[nums[left]] == 0 {
                    countMap.removeValue(forKey: nums[left])
                }
                left += 1
            }
        }

        return minLength == Int.max ? 0 : minLength
    }

}
