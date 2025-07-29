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


extension Day15 {
    /*
     # ✅ 문제: 고정 합을 가진 부분 배열의 개수

     정수 배열 `nums`와 정수 `target`이 주어졌을 때,
     **합이 정확히 target이 되는 연속 부분 배열(subarray)의 개수**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 1, 1], target = 2
     Output: 2
     // [1,1]이 2번 등장
     ```

     ```swift
     Input: nums = [1, 2, 3], target = 3
     Output: 2
     // [1,2], [3]
     ```

     ```swift
     Input: nums = [3, 4, 7, -2, 2, 1, 4], target = 7
     Output: 3
     // 가능한 조합: [3,4], [7], [2,1,4]
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10⁵
     - -10⁴ <= nums[i] <= 10⁴
     - -10⁹ <= target <= 10⁹
     */
    static func subarraySum(
        _ nums: [Int],
        _ target: Int
    ) -> Int {
        var count = 0
        var sum = 0
        var prefixCount: [Int: Int] = [0: 1]
        
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            sum += rightValue
            let diff = sum - target
            if let freq = prefixCount[diff] {
                count += freq
            }
            prefixCount[sum, default: 0] += 1
        }
        return count
    }
}

extension Day15 {
    /*
     # ✅ 문제: 동일한 원소 개수를 포함하는 부분 배열의 개수

     정수 배열 nums, 정수 target, 정수 k가 주어졌을 때,
     target이 정확히 k번 등장하는 모든 연속 부분 배열의 개수를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 2, 1, 2, 1], target = 1, k = 2
     Output: 4
     // 가능한 조합:
     [1,2,1] (0~2)
     [1,2,1,2] (0~3)
     [2,1,2,1] (1~4)
     [1,2,1] (2~4)
     ```

     ```swift
     Input: nums = [1, 1, 1, 1], target = 1, k = 3
     Output: 2
     // [1,1,1] (index 0~2), [1,1,1] (index 1~3)
     ```

     ```swift
     Input: nums = [2, 3, 4], target = 3, k = 1
     Output: 4
     // 가능한 조합: [2,3], [2,3,4], [3], [3,4]
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10⁵
     - 0 <= nums[i], k <= 10⁴
     */
    static func subarraysWithKOccurrences(
        _ nums: [Int],
        _ target: Int,
        _ k: Int
    ) -> Int {
        var countDict: [Int: Int] = [0: 1]  // count 0은 항상 하나 있다고 가정
        var targetCount = 0
        var result = 0

        for num in nums {
            if num == target {
                targetCount += 1
            }

            // countMap에 (targetCount - k) 값이 있다면, 그것만큼 정답이 됨
            if let count = countDict[targetCount - k] {
                result += count
            }

            countDict[targetCount, default: 0] += 1
        }

        return result
    }
}

extension Day15 {
    /*
     # ✅ 문제: 1이 정확히 K번 등장하는 부분 배열 개수

     0과 1로만 이루어진 정수 배열 `nums`와 정수 `k`가 주어질 때,
     **정수 1이 정확히 `k번` 등장하는 모든 연속 부분 배열(subarray)의 개수**를 구하세요.

     ---

     ## ✳️ 입력 예시

     ### 예시 1
     Input:
     nums = [1, 0, 1, 0, 1]
     k = 2

     Output:
     4

     ### 예시 2
     Input:
     nums = [1, 1, 1, 1]
     k = 2

     Output:
     3

     ### 예시 3
     Input:
     nums = [0, 0, 0, 0]
     k = 0

     Output:
     10
     (모든 부분 배열이 1을 0번 포함함)

     ---

     ## ❗️조건

     - 1 ≤ nums.count ≤ 100,000
     - 0 ≤ k ≤ nums.count
     - nums의 원소는 오직 0 또는 1
     */
    static func countSubarraysWithKOnes(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var countDict: [Int: Int] = [0: 1]
        var targetCount = 0
        var result = 0

        for num in nums {
            targetCount += num
            result += countDict[targetCount - k, default: 0]
            countDict[targetCount, default: 0] += 1
        }

        return result
    }
}

extension Day15 {
    /*
     # ✅ 문제: 동일한 숫자가 K번 이하로 등장하는 부분 배열의 개수

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **어떤 숫자든 간에, 가장 많이 등장한 숫자의 빈도가 `k` 이하인 모든 연속 부분 배열(subarray)**의 개수를 구하세요.

     ---

     ## ✳️ 입력 예시

     ### 예시 1
     Input:
     nums = [1, 2, 1], k = 2

     Output:
     6

     설명:
     가능한 부분 배열은 다음과 같음
     [1], [2], [1], [1,2], [2,1], [1,2,1] → 총 6개


     ### 예시 2
     Input:
     nums = [1, 1, 1, 2, 2], k = 2

     Output:
     8

     설명:
     빈도가 3인 [1,1,1] 등은 조건을 초과하므로 제외됨

     ---

     ## ❗️조건

     - 1 ≤ nums.count ≤ 100,000
     - 1 ≤ k ≤ nums.count
     - 0 ≤ nums[i] ≤ 10,000
     */
    static func countSubarraysWithMaxFrequencyAtMostK(
        _ nums: [Int],
        _ k: Int
    ) -> Int { // 이런 유형 연습 필요
        var left = 0
        var freq: [Int: Int] = [:]
        var count = 0

        for right in 0..<nums.count {
            let num = nums[right]
            freq[num, default: 0] += 1

            // 윈도우 내에서 가장 많이 등장한 숫자의 빈도 계산
            while let currentMax = freq.values.max(), currentMax > k {
                let leftNum = nums[left]
                freq[leftNum]! -= 1
                if freq[leftNum]! == 0 {
                    freq.removeValue(forKey: leftNum)
                }
                left += 1
            }

            count += (right - left + 1)
        }

        return count
    }


}
