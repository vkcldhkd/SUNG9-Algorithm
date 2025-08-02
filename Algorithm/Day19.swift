//
//  Day19.swift
//  Algorithm
//
//  Created by HYUN SUNG on 8/2/25.
//

enum Day19 { }

extension Day19 {
    /*
     # ✅ 문제: 합이 k 이상인 가장 짧은 연속 부분 배열 길이 (Shortest Subarray With Sum At Least K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 `k` 이상인 연속 부분 배열 중에서 가장 짧은 길이**를 구하세요.
     조건을 만족하는 부분 배열이 없으면 `0`을 반환하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [2, 3, 1, 2, 4, 3]
     let k = 7
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 1, 1, 1, 1]
     let k = 11
     ```

     ## ✳️ 출력 예시 2
     ```swift
     0
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 4, 4]
     let k = 4
     ```

     ## ✳️ 출력 예시 3
     ```swift
     1
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 1 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁹
     */
    
    static func shortestSubarrayWithSumAtLeastK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var sum = 0
        var minLength = Int.max
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            sum += rightValue
            
            while sum >= k {
                minLength = min(minLength, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        
        return minLength == Int.max ? 0 : minLength
    }
}

extension Day19 {
    /*
     # ✅ 문제: 합이 k 이하인 모든 연속 부분 배열의 개수 (Count Subarrays With Sum At Most K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 `k` 이하인 모든 연속 부분 배열(subarray)** 의 **개수**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3]
     let k = 4
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [2, 1, 1, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     8
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 1, 2, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 3
     ```swift
     5
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 1 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁹
     */
    
    static func countSubarraysWithSumAtMostK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var result = 0
        var sum = 0
        
        for right in 0 ..< nums.count {
            sum += nums[right]
            
            while sum > k {
                sum -= nums[left]
                left += 1
            }
            
            result += right - left + 1
        }
        
        return result
    }
}

extension Day19 {
    /*
     # ✅ 문제: 합이 정확히 k인 모든 연속 부분 배열 구하기 (Find All Subarrays With Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 정확히 `k`인 모든 연속 부분 배열(subarray)** 을 찾아 반환하세요.
     출력은 `[Int]` 배열들의 배열이어야 합니다.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3, 2, 1]
     let k = 5
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [[2, 3], [3, 2]]
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     [[1, 1], [1, 1]]
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [2, 4, 6]
     let k = 8
     ```

     ## ✳️ 출력 예시 3
     ```swift
     []
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁴
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁵ ≤ k ≤ 10⁵
     */
    
    static func findAllSubarraysWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> [[Int]] {
        let n = nums.count
        var result: [[Int]] = []
        
        for i in 0 ..< n {
            var sum = 0
            for j in i ..< n {
                sum += nums[j]
                
                if sum == k {
                    result.append(Array(nums[i ... j]))
                }
            }
        }
        
        return result
    }
}

extension Day19 {
    /*
     # ✅ 문제: 합이 정확히 k인 연속 부분 배열의 개수 (Count Subarrays With Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 정확히 `k`인 모든 연속 부분 배열(subarray)** 의 **개수**를 구하세요.

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

     - 부분 배열: `[1,2]`, `[3]`

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     - 부분 배열: `[1,1]` (두 번)

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 4, 7, -2, 2, 1, 4, 2]
     let k = 7
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```

     - 부분 배열: `[3,4]`, `[7]`, `[4, 2, 1]`, `[1, 4, 2]`

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁵ ≤ k ≤ 10⁵
     */
    static func countSubarraysWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {

        var prefixSum = 0
        var freqDict: [Int: Int] = [0: 1]
        var count = 0
        
        for num in nums {
            prefixSum += num
            
            count += freqDict[prefixSum - k, default: 0]
            freqDict[prefixSum, default: 0] += 1
        }
        
        return count
    }
}


extension Day19 {
    /*
     # ✅ 문제: 합이 정확히 k인 가장 긴 연속 부분 배열의 길이 (Max Length Subarray Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 **정확히 `k`인 가장 긴 연속 부분 배열(subarray)** 의 **길이**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, -1, 5, -2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```

     - 부분 배열: `[-1, 5, -2, 3]` (합 = 3)

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [-2, -1, 2, 1]
     let k = 1
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     - 부분 배열: `[2, -1]`

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 2, 3]
     let k = 6
     ```

     ## ✳️ 출력 예시 3
     ```swift
     3
     ```

     - 부분 배열: `[1, 2, 3]`

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁵ ≤ k ≤ 10⁵
     */
    
    static func maxLengthSubarrayWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixSum = 0
        var indexDict: [Int: Int] = [0: -1]
        var maxLength = 0

        for (i, num) in nums.enumerated() {
            prefixSum += num

            if let prevIndex = indexDict[prefixSum - k] {
                maxLength = max(maxLength, i - prevIndex)
            }

            if indexDict[prefixSum] == nil {
                indexDict[prefixSum] = i
            }
        }

        return maxLength
    }
}


extension Day19 {
    /*
     # ✅ 문제: 합이 정확히 k인 가장 짧은 연속 부분 배열의 길이 (Min Length Subarray Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 **정확히 `k`**인 **가장 짧은 연속 부분 배열(subarray)** 의 **길이**를 구하세요.
     단, 그런 부분 배열이 없으면 `0`을 반환하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, -1, 5, -2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 1
     ```swift
     1
     ```

     - 부분 배열: `[5, -2]` 또는 `[3]` 등

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [-2, -1, 2, 1]
     let k = 1
     ```

     ## ✳️ 출력 예시 2
     ```swift
     1
     ```

     - 부분 배열: `[1]`

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 2, 3]
     let k = 7
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 합이 7인 부분 배열이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁵ ≤ k ≤ 10⁵
     */
    static func minLengthSubarrayWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixSum = 0
        var indexDict: [Int: Int] = [0: -1]
        var minLength = Int.max

        for (i, num) in nums.enumerated() {
            prefixSum += num

            if let prevIndex = indexDict[prefixSum - k] {
                minLength = min(minLength, i - prevIndex)
            }

            if indexDict[prefixSum] == nil {
                indexDict[prefixSum] = i
            }
        }

        return minLength == Int.max ? 0 : minLength
    }
}
