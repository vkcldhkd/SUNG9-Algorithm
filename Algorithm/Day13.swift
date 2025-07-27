//
//  Day13.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/25/25.
//

enum Day13 { }

extension Day13 {
    /*
     # ✅ 문제: Missing Integer
     자연수로 이루어진 배열이 주어질 때, 배열에 존재하지 않는 가장 작은 자연수를 찾아 반환하세요.
     배열에는 중복된 수가 있을 수 있습니다.

     ---

     ### ✳️ 입력 예시
     Input: [1, 3, 6, 4, 1, 2]
     Output: 5

     Input: [1, 2, 3]
     Output: 4

     Input: [-1, -3]
     Output: 1

     ---

     ### ❗️조건
     - 배열의 길이: `1 <= A.count <= 100,000`
     - 각 원소의 범위: `-1,000,000 <= A[i] <= 1,000,000`
     - 시간복잡도는 `O(N)` 또는 `O(N * log N)` 이내로 해결해야 합니다.
     */
    
    static func findMissingPositive(_ numbers: [Int]) -> Int {
        let numberToSet = Set(numbers.filter { $0 > 0 })
        
        var current = 1
        while true {
            if !numberToSet.contains(current) {
                return current
            }
            current += 1
        }
    }
}

extension Day13 {
    /*
     # ✅ 문제: Longest Substring Without Repeating Characters
     주어진 문자열에서 **중복 문자가 없는 가장 긴 부분 문자열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: "abcabcbb"
     Output: 3

     Input: "bbbbb"
     Output: 1

     Input: "pwwkew"
     Output: 3

     ---

     ### ❗️조건

     - 문자열의 길이: `1 <= s.count <= 100,000`
     - 문자열은 오직 알파벳 소문자와 숫자로 구성됩니다.
     - 시간복잡도는 **O(N)** 이하로 해결해야 합니다.
     */
    
    static func lengthOfLongestSubstring(_ chars: String) -> Int {
        var charSet = Set<Character>()
        let chars = Array(chars)
        var left = 0
        var maxLength = 0

        for right in 0 ..< chars.count {
            while charSet.contains(chars[right]) {
                charSet.remove(chars[left])
                left += 1
            }
            charSet.insert(chars[right])
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}

extension Day13 {
    /*
     # ✅ 문제 3: Longest Substring with At Most K Distinct Characters
     주어진 문자열과 정수 `k`가 주어질 때, **서로 다른 문자가 최대 `k`개까지 허용되는 가장 긴 부분 문자열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: s = "eceba", k = 2
     Output: 3  // "ece"

     Input: s = "aa", k = 1
     Output: 2  // "aa"

     Input: s = "aabbcc", k = 2
     Output: 4  // "aabb", "bbcc" 가능

     ---

     ### ❗️조건

     - 문자열의 길이: `1 <= s.count <= 100,000`
     - `k`: `1 <= k <= 26`
     - 시간복잡도는 **O(N)** 이내여야 합니다.
     */
    
    static func lengthOfLongestSubstringKDistinct(
        _ s: String,
        _ k: Int
    ) -> Int { // 슬라이딩 윈도우 개념 더 익혀야할듯...
        guard k > 0 else { return 0 }
        let chars = Array(s)
        var left = 0
        var maxLength = 0
        var freq: [Character: Int] = [:]  // 각 문자 등장 횟수

        for right in 0..<chars.count {
            let char = chars[right]
            freq[char, default: 0] += 1

            // 윈도우 내 서로 다른 문자 개수가 k 초과되면 left 이동
            while freq.keys.count > k {
                let leftChar = chars[left]
                freq[leftChar]! -= 1
                if freq[leftChar]! == 0 {
                    freq.removeValue(forKey: leftChar)
                }
                left += 1
            }

            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}

extension Day13 {
    /*
     # ✅ 문제: Maximum Sum of Subarray of Size K

     정수 배열 `nums`와 정수 `k`가 주어질 때, **길이가 k인 연속 부분 배열의 합의 최댓값**을 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: nums = [2, 1, 5, 1, 3, 2], k = 3
     Output: 9   // 부분 배열 [5, 1, 3]의 합이 최댓값

     Input: nums = [1, 9, -1, -2, 7, 3], k = 2
     Output: 10  // [7, 3]

     Input: nums = [5, 2, 1, 8, 3, 2], k = 3
     Output: 13  // [8, 3, 2]

     ---

     ### ❗️조건

     - 배열 길이: `k <= nums.count <= 100,000`
     - 원소 범위: `-10^4 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내로 해결해야 합니다.
     */
    
    static func maxSumSubarrayOfSizeK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        
        var windowSum = nums[0...k-1].reduce(0, +)
        var maxValue = windowSum
        
        for i in k ..< nums.count {
            windowSum += nums[i] - nums [i-k]
            maxValue = max(maxValue, windowSum)
        }
        
        return maxValue
    }
}


extension Day13 {
    /*
     # ✅ 문제: Minimum Size Subarray Sum

     양의 정수 배열 `nums`와 양의 정수 `target`이 주어질 때,
     합이 `target` 이상이 되는 가장 짧은 연속 부분 배열의 길이를 구하세요.
     만약 그러한 부분 배열이 없다면 0을 반환하세요.

     ---

     ### ✳️ 입력 예시
     Input: target = 7, nums = [2, 3, 1, 2, 4, 3]
     Output: 2  // [4, 3]

     Input: target = 15, nums = [1, 2, 3, 4, 5]
     Output: 5  // [1,2,3,4,5]

     Input: target = 100, nums = [1, 1, 1, 1]
     Output: 0  // 조건을 만족하는 구간 없음

     ---

     ### ❗️조건

     - 배열 길이: `1 <= nums.count <= 100,000`
     - 원소 값: `1 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내로 해결해야 합니다.
     */
    
    static func minSubArrayLen(
        _ target: Int,
        _ nums: [Int]
    ) -> Int {
        var left = 0
        var sum = 0
        var minLength = Int.max
        
        for right in 0 ..< nums.count {
            sum += nums[right]
            
            while sum >= target {
                minLength = min(minLength, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }

        return minLength == Int.max ? 0 : minLength
    }
}


extension Day13 {
    /*
     # ✅ 문제: Count Subarrays with Sum Less Than Target

     정수 배열 `nums`와 정수 `target`이 주어질 때,
     합이 `target` 미만인 **모든 연속된 부분 배열(subarray)**의 개수를 구하세요.

     ---

     ### ✳️ 입력 예시
     Input: nums = [1, 2, 3], target = 5
     Output: 4
     // 가능한 구간: [1], [2], [1,2], [3]

     Input: nums = [1, 1, 1], target = 3
     Output: 5
     // 모든 구간이 조건 만족

     Input: nums = [2, 1, 1, 3], target = 4
     Output: 6
     // [2], [1], [1], [2,1], [1,1], [1,1]
     ---

     ### ❗️조건

     - 배열 길이: `1 <= nums.count <= 50,000`
     - 원소 값: `1 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 또는 `O(N log N)` 이내여야 합니다.
     */
    
    static func countSubarraysLessThanTarget(
        _ nums: [Int],
        _ target: Int
    ) -> Int {
        var left = 0
        var sum = 0
        var count = 0

        for right in 0..<nums.count {
            sum += nums[right]

            while sum >= target {
                sum -= nums[left]
                left += 1
            }

            // 현재 윈도우에서 만들 수 있는 모든 부분 배열 개수는 (right - left + 1)
            count += (right - left + 1)
        }

        return count
    }
}

extension Day13 {
    /*
     # ✅ 문제: Fixed-Size Window Sum
     
     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **길이가 정확히 `k`인 모든 연속된 부분 배열(subarray)의 합을 차례대로 출력**하세요.
     
     ---
     
     ### ✳️ 입력 예시
     Input: nums = [1, 2, 3, 4, 5], k = 3
     Output: [6, 9, 12]
     
     Input: nums = [10, 20, 30, 40], k = 2
     Output: [30, 50, 70]
     
     Input: nums = [7, 8, 9], k = 1
     Output: [7, 8, 9]
     
     ---
     
     ### ❗️조건
     
     - 배열 길이: `k <= nums.count <= 100,000`
     - 각 원소 범위: `-10^4 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내여야 합니다.
     */
    
    static func windowSums(
        _ nums: [Int],
        _ k: Int
    ) -> [Int] {
        guard k <= nums.count else { return [] }
        var windowSum = nums[0 ..< k].reduce(0, +)
        var result: [Int] = []
        result.append(windowSum)
        for i in k ..< nums.count {
            windowSum += nums[i] - nums[i-k]
            result.append(windowSum)
        }
        
        return result
    }
}


extension Day13 {
    /*
     # ✅ 문제: Maximum Sum of Subarray of Size K with Index

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     합이 가장 큰 **길이 `k`인 연속 부분 배열(subarray)**의 합과 **해당 구간의 시작 인덱스**를 반환하세요.

     ---

     ### ✳️ 입력 예시
     Input: nums = [1, 4, 2, 10, 23, 3, 1, 0, 20], k = 4
     Output: (39, 1)
     // 최대 합: [4, 2, 10, 23] → 합 = 39, 시작 인덱스 = 1

     Input: nums = [2, 3], k = 2
     Output: (5, 0)

     Input: nums = [5, -1, 2, 6, -2, 4], k = 3
     Output: (9, 2) // [2, 6, -2]

     ---

     ### ❗️조건

     - 배열 길이: `k <= nums.count <= 100,000`
     - 각 원소 범위: `-10^4 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내로 해결해야 합니다.
     */
    
    static func maxSumSubarrayWithIndex(
        _ nums: [Int],
        _ k: Int
    ) -> (sum: Int, startIndex: Int) {
        
        var windowSum = nums[0 ..< k].reduce(0, +)
        var maxSum = windowSum
        var startIndex = 0
        
        for i in k ..< nums.count {
            windowSum += nums[i] - nums[i-k]
            
            if windowSum > maxSum {
                maxSum = windowSum
                startIndex = i - k + 1
            }
        }
        
        return (maxSum, startIndex)
    }
}

extension Day13 {
    /*
     # ✅ 문제: Longest Subarray with Sum Less Than or Equal to Target

     정수 배열 `nums`와 정수 `target`이 주어질 때,
     **합이 `target` 이하인 가장 긴 연속 부분 배열(subarray)의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 2, 1, 0, 1, 1, 0], target = 4
     Output: 5
     // 가장 긴 구간: [1, 0, 1, 1, 0]
     ```

     ```swift
     Input: nums = [1, 2, 3, 4, 5], target = 11
     Output: 4
     // 가장 긴 구간: [1, 2, 3, 4]
     ```

     ```swift
     Input: nums = [5, 1, 3, 5, 2, 1, 1, 1], target = 8
     Output: 4
     // 가장 긴 구간: [2, 1, 1, 1]
     ```

     ---

     ### ❗️조건

     - 배열 길이: `1 <= nums.count <= 100,000`
     - 원소 값: `0 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내로 해결해야 합니다.
     */
    static func longestSubarraySumLEQ(
        _ nums: [Int],
        _ target: Int
    ) -> Int {
        var left = 0
        var windowSum = 0
        var maxLength = 0

        for right in 0..<nums.count {
            windowSum += nums[right]

            // 조건 위반 시 → 왼쪽을 옮겨서 조건을 만족시킴
            while windowSum > target && left <= right {
                windowSum -= nums[left]
                left += 1
            }

            // 조건 만족 → 현재 윈도우 길이로 max 갱신
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
}

extension Day13 {
    /*
     # ✅ 문제: Longest Subarray with At Most K Zeros

     정수 배열 `nums`는 0과 1로만 이루어져 있습니다.
     `nums`에서 최대 `k`개의 0을 1로 바꿀 수 있을 때,
     **모두 1로만 이루어진 가장 긴 연속 부분 배열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 1, 0, 0, 1, 1, 1, 0], k = 2
     Output: 7
     // 0을 2개까지 1로 바꿀 수 있으므로 [1,1,0,0,1,1,1] → 길이 7
     ```

     ```swift
     Input: nums = [0, 0, 1, 1, 1, 0, 0], k = 1
     Output: 4
     // [1,1,1,0] 또는 [0,1,1,1]
     ```

     ```swift
     Input: nums = [1, 1, 1, 1], k = 0
     Output: 4
     // 이미 모두 1
     ```

     ---

     ### ❗️조건

     - 배열 길이: `1 <= nums.count <= 100,000`
     - 원소 값: `0 또는 1`
     - 시간복잡도: `O(N)` 이내로 해결해야 합니다.
     */
    
    static func longestOnesWithKFlips(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var zeroCount = 0
        var maxLength = 0
        
        for right in 0 ..< nums.count {
            if nums[right] == 0 {
                zeroCount += 1
            }
            
            while zeroCount > k {
                if nums[left] == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            maxLength = max(maxLength, right - left  + 1)
        }
        
        return maxLength
    }
}

extension Day13 {
    /*
     # ✅ 문제: Max Average of Subarray of Size K

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     길이가 정확히 `k`인 연속 부분 배열(subarray) 중에서 **평균값이 가장 큰 값을 반환**하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1, 12, -5, -6, 50, 3], k = 4
     Output: 12.75
     // [12, -5, -6, 50]의 평균 = (12 + -5 + -6 + 50) / 4 = 51 / 4 = 12.75
     ```

     ```swift
     Input: nums = [5], k = 1
     Output: 5.0
     ```

     ```swift
     Input: nums = [0, 4, 0, 3, 2], k = 2
     Output: 2.5
     ```

     ---

     ### ❗️조건

     - 배열 길이: `k <= nums.count <= 100,000`
     - 원소 값: `-10^4 <= nums[i] <= 10^4`
     - 시간복잡도는 `O(N)` 이내여야 합니다.
     */
    static func findMaxAverage(
        _ nums: [Int],
        _ k: Int
    ) -> Double {
        guard k <= nums.count else { return 0.0 }
        
        var windowSum = nums[0 ..< k].reduce(0, +)
        var maxValue = Double(windowSum) / Double(k)
        
        for i in k ..< nums.count {
            windowSum += nums[i] - nums[i-k]
            maxValue = max(maxValue, Double(windowSum) / Double(k))
        }
        return maxValue
    }
}
