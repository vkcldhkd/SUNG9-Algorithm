//
//  Day18.swift
//  Algorithm
//
//  Created by HYUN SUNG on 8/1/25.
//

enum Day18 { }

extension Day18 {
    /*
     # ✅ 문제: 두 수의 합 (Two Sum)

     정수 배열 `nums`와 정수 `target`이 주어졌을 때,
     배열에서 두 수를 골라 그 합이 `target`이 되는 **두 수의 인덱스**를 반환하세요.
     항상 정확히 하나의 해만 존재한다고 가정합니다.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [2, 7, 11, 15]
     let target = 9
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [0, 1]
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [3, 2, 4]
     let target = 6
     ```

     ## ✳️ 출력 예시 2
     ```swift
     [1, 2]
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 3]
     let target = 6
     ```

     ## ✳️ 출력 예시 3
     ```swift
     [0, 1]
     ```

     ---

     ## ❗️조건
     - 2 ≤ nums.count ≤ 10⁴
     - -10⁹ ≤ nums[i] ≤ 10⁹
     - -10⁹ ≤ target ≤ 10⁹
     - 정답이 여러 개 있는 경우는 없습니다.
     */
    static func twoSum(
        _ nums: [Int],
        _ target: Int
    ) -> [Int] {
        
        var indexMap: [Int: Int] = [:]
        
        for (i, num) in nums.enumerated() {
            let complement = target - num
            if let j = indexMap[complement] {
                return [j, i]
            }
            indexMap[num] = i
        }
        
        return []
    }
}

extension Day18 {
    /*
     # ✅ 문제: 부분 합이 목표인 부분 배열 (Subarray Sum Equals K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 정확히 `k`가 되는 연속된 부분 배열의 개수를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 4, 7, 2, -3, 1, 4, 2]
     let k = 7
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 20,000
     - -1000 ≤ nums[i] ≤ 1000
     - -10⁷ ≤ k ≤ 10⁷
     */
    static func countSubarraysWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixSum = 0
        var result = 0
        var freqDict: [Int: Int] = [0: 1]
        
        
        for num in nums {
            prefixSum += num
            
            if let freq = freqDict[prefixSum - k] {
                result += freq
            }
            
            freqDict[prefixSum, default: 0] += 1
        }
        
        return result
    }
}

extension Day18 {
    /*
     # ✅ 문제: 부분 합이 k의 배수인 부분 배열 개수 (Subarray Sum is Multiple of K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 `k`의 배수인 (0 포함) **연속된 부분 배열의 개수**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3, 4, 5]
     let k = 3
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [5, 7, 1, 3]
     let k = 4
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 0 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁴
     */
    
    static func countSubarraysWithSumMultipleOfK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixSum = 0
        var countDict: [Int: Int] = [0: 1]
        var result = 0

        for num in nums {
            prefixSum += num
            let mod = (prefixSum % k + k) % k  // 중요: 음수 방지
            result += countDict[mod, default: 0]
            countDict[mod, default: 0] += 1
        }
        return result
    }
}

extension Day18 {
    /*
     # ✅ 문제: 합이 k 이하인 부분 배열의 수 (Count Subarrays With Sum At Most K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **합이 k 이하인 모든 연속 부분 배열의 개수**를 구하세요.

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
     - 0 ≤ nums[i] ≤ 10⁴
     - 0 ≤ k ≤ 10⁹
     */
    static func countSubarraysWithSumAtMostK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {

        var sum = 0
        var left = 0
        var result = 0
        
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

extension Day18 {
    /*
     # ✅ 문제: 부분합이 짝수인 부분 배열의 개수 (Count Subarrays With Even Sum)

     정수 배열 `nums`가 주어졌을 때,
     합이 **짝수인 연속된 부분 배열의 개수**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3, 4]
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [2, 2, 2]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     6
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 3, 5]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     3
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     */
    static func countSubarraysWithEvenSum(_ nums: [Int]) -> Int {
        var prefixSum = 0
        var result = 0
        var countDict: [Int: Int] = [0: 1]
        
        for num in nums {
            prefixSum += num
            
            let mod = (prefixSum % 2 + 2) % 2  // 음수 대응
            result += countDict[mod, default: 0]
            countDict[mod, default: 0] += 1
        }
        
        return result
    }
}


extension Day18 {
    /*
     # ✅ 문제: 짝수 길이 부분 배열 중 중앙값이 k인 개수 (Count Subarrays with Median K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **중앙값(median)이 정확히 `k`인 부분 배열의 개수**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [3, 2, 1, 4, 5]
     let k = 4
     ```

     ## ✳️ 출력 예시 1
     ```swift
     3
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [2, 3, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     1
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [5, 5, 5, 5]
     let k = 5
     ```

     ## ✳️ 출력 예시 3
     ```swift
     10
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 1 ≤ nums[i], k ≤ 10⁵
     - `k`는 반드시 배열에 최소 한 번 등장합니다
     */
    
    static func countSubarraysWithMedianK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        // 이 문제는 조금 더 연습 필요..
        
        guard let kIndex = nums.firstIndex(of: k) else { return 0 }

        var balance = 0
        var leftCounter: [Int: Int] = [0: 1]

        // 왼쪽 → k 까지 탐색하며 balance 저장
        for i in stride(from: kIndex - 1, through: 0, by: -1) {
            if nums[i] < k {
                balance -= 1
            } else if nums[i] > k {
                balance += 1
            }
            leftCounter[balance, default: 0] += 1
        }

        var result = leftCounter[0, default: 0] + leftCounter[-1, default: 0]
        balance = 0

        // k → 오른쪽으로 탐색하며 매칭되는 balance 계산
        for i in kIndex + 1 ..< nums.count {
            if nums[i] < k {
                balance -= 1
            } else if nums[i] > k {
                balance += 1
            }

            result += leftCounter[-balance, default: 0]
            result += leftCounter[-balance + 1, default: 0]
        }

        return result
    }

}


extension Day18 {
    /*
     # ✅ 문제: 합이 k인 부분 배열의 수 (Count Subarrays with Sum K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 **정확히 k**가 되는 연속된 부분 배열의 개수를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 4, 7, 2, -3, 1, 4, 2]
     let k = 7
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 20,000
     - -1000 ≤ nums[i] ≤ 1000
     - -10⁷ ≤ k ≤ 10⁷
     */
    
    static func countSubarraysWithSumExactlyK2 (
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var count = 0
        var prefixSum = 0
        var freqDict: [Int: Int] = [0: 1]
        
        for num in nums {
            prefixSum += num
            
            
            if let freq = freqDict[prefixSum - k] {
                count += freq
            }
            freqDict[prefixSum, default: 0] += 1
        }
        
        return count
    }
}

extension Day18 {
    /*
     # ✅ 문제: 합이 정확히 k인 가장 긴 부분 배열의 길이 (Maximum Length Subarray With Sum K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 **정확히 k가 되는 가장 긴 연속 부분 배열의 길이**를 구하세요.

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

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 2, 3]
     let k = 3
     ```

     ## ✳️ 출력 예시 3
     ```swift
     2
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - -10⁷ ≤ k ≤ 10⁷
     */
    static func maxLengthSubarrayWithSumK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var maxLength = 0
        var prefixSum = 0
        var indexDict: [Int: Int] = [: ]
        
        for (i, num) in nums.enumerated() {
            prefixSum += num
            
            if prefixSum == k {
                maxLength = max(maxLength, i+1)
            }
            
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

extension Day18 {
    /*
     # ✅ 문제: 합이 정확히 k인 가장 짧은 부분 배열의 길이 (Minimum Length Subarray With Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 정확히 `k`가 되는 **가장 짧은 연속된 부분 배열의 길이**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3, 4, 5]
     let k = 9
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 1, 1, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [2, 4, 6, 10]
     let k = 100
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 1 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁹
     */
    static func minLengthSubarrayWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var minLength = Int.max
        var prefixSum = 0
        var indexDict: [Int: Int] = [: ]
        
        for (i, num) in nums.enumerated() {
            prefixSum += num
            
            if prefixSum == k {
                minLength = min(minLength, i+1)
            }
            
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

extension Day18 {
    /*
     # ✅ 문제: 합이 k 이상인 가장 짧은 부분 배열의 길이 (Minimum Length Subarray With Sum ≥ K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 **k 이상인** 연속된 부분 배열 중에서 **가장 짧은 길이**를 구하세요.

     존재하지 않는다면 0을 반환하세요.

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
     let nums = [1, 4, 4]
     let k = 4
     ```

     ## ✳️ 출력 예시 2
     ```swift
     1
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1, 1, 1, 1, 1, 1]
     let k = 11
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 1 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁹

     ---
     */
    static func minLengthSubarrayWithSumAtLeastK (
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var minLength = Int.max
        var prefixSum = 0
        var left = 0
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            prefixSum += rightValue
            
            while prefixSum >= k {
                minLength = min(minLength, right - left + 1)
                prefixSum -= nums[left]
                left += 1
            }
        }
        return minLength == Int.max ? 0 : minLength
    }
}

extension Day18 {
    /*
     # ✅ 문제: 합이 k 이상이 되는 최소 연속 부분 배열 (출력 포함)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 `k` 이상이 되는 **가장 짧은 연속 부분 배열을 직접 반환**하세요.

     존재하지 않는다면 `[]`를 반환하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [2, 3, 1, 2, 4, 3]
     let k = 7
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [4, 3]
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 4, 4]
     let k = 4
     ```

     ## ✳️ 출력 예시 2
     ```swift
     [4]
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1, 1, 1, 1, 1, 1]
     let k = 11
     ```

     ## ✳️ 출력 예시 3
     ```swift
     []
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
    ) -> [Int] {
        var minLength = Int.max
        var start = 0
        var prefixSum = 0
        var result: [Int] = []
        
        for (end, num) in nums.enumerated() {
            prefixSum += num
            
            while prefixSum >= k {
                if end - start + 1 < minLength {
                    result = Array(nums[start...end])
                    minLength = end - start + 1
                }
                prefixSum -= nums[start]
                start += 1
            }
        }
        return result
    }
}

extension Day18 {
    /*
     # ✅ 문제: 합이 정확히 k인 모든 부분 배열 반환 (Find All Subarrays With Sum Exactly K)

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     합이 정확히 `k`가 되는 **모든 연속 부분 배열(subarray)** 을 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 3, 2, 1]
     let k = 5
     ```

     ## ✳️ 출력 예시 1
     ```swift
     [[2, 3], [3, 2], [1, 2, 2]]
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
     [[2, 6]]
     ```

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁴
     - 1 ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁹

     */
    
    static func findAllSubarraysWithSumExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> [[Int]] {
        var result: [[Int]] = []
        let n = nums.count

        for start in 0 ..< n {
            var sum = 0
            for end in start ..< n {
                sum += nums[end]

                if sum == k {
                    result.append(Array(nums[start...end]))
                } else if sum > k {
                    break
                }
            }
        }

        return result
    }
}
