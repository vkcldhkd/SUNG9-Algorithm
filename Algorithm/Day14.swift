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

extension Day14 {
    /*
     # ✅ 문제: Longest Substring with At Most K Distinct Characters

     문자열 `s`와 정수 `k`가 주어질 때,
     **서로 다른 문자가 최대 `k`개 이하인 가장 긴 부분 문자열(substring)**의 길이를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: s = "eceba", k = 2
     Output: 3
     // 가능한 부분 문자열: "ece"
     ```

     ```swift
     Input: s = "aa", k = 1
     Output: 2
     // 가능한 부분 문자열: "aa"
     ```

     ```swift
     Input: s = "aabbcc", k = 1
     Output: 2
     // 가능한 부분 문자열: "aa", "bb", 또는 "cc"
     ```

     ---

     ### ❗️조건

     - 문자열 길이: `1 <= s.count <= 100,000`
     - 문자열은 소문자 알파벳(a~z)로만 구성
     - 시간복잡도는 `O(N)` 이내여야 합니다.
     */
    
    static func lengthOfLongestSubstringKDistinct(
        _ s: String,
        _ k: Int
    ) -> Int {
        guard k > 0 else { return 0 }
        let chars = Array(s)
        var left = 0
        var maxLength = 0
        var freq: [Character: Int] = [:]

        for right in 0..<chars.count {
            let char = chars[right]
            freq[char, default: 0] += 1

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


extension Day14 {
    /*
     # ✅ 문제: Longest Substring Without Repeating Characters

     문자열 `s`가 주어졌을 때, **중복되지 않는 문자가 포함된 가장 긴 부분 문자열**의 길이를 구하세요.

     이때 부분 문자열은 **연속된 문자**로 구성되어야 하며,
     대소문자를 구분하고 공백도 하나의 문자로 간주합니다.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: s = "abcabcbb"
     Output: 3  // "abc"
     ```

     ```swift
     Input: s = "bbbbb"
     Output: 1  // "b"
     ```

     ```swift
     Input: s = "pwwkew"
     Output: 3  // "wke"
     ```

     ---

     ### ❗️조건

     - 1 <= s.count <= 10^5
     - 문자열은 ASCII 문자로만 구성
     - 중복 문자 없이 가장 긴 부분 문자열의 길이를 구하세요
     */
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var charSet: Set<Character> = Set()
        let sToArray = Array(s)
        var left = 0
        var maxLength = 0
        
        for right in 0 ..< sToArray.count {
            let rightValue = sToArray[right]
            while charSet.contains(rightValue) {
                charSet.remove(sToArray[left])
                left += 1
            }
            
            charSet.insert(rightValue)
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

extension Day14 {
    /*
     # ✅ 문제: Longest Repeating Character Replacement

     문자열 `s`가 주어졌을 때,
     하나의 문자를 선택해서 최대 `k`번까지 다른 문자로 바꿀 수 있다면
     **같은 문자가 연속되는 가장 긴 부분 문자열의 길이**는 얼마일까요?

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: s = "ABAB", k = 2
     Output: 4  // "ABAB" 전체를 B로 바꿀 수 있음
     ```

     ```swift
     Input: s = "AABABBA", k = 1
     Output: 4  // "AABA" 또는 "BABB" 중 하나
     ```

     ```swift
     Input: s = "ABCDE", k = 1
     Output: 2
     ```

     ---

     ### ❗️조건

     - 1 <= s.count <= 10^5
     - s는 대문자 알파벳으로만 구성
     - 주어진 `k`번 이하로 문자 교체가 가능해야 함
     */
    
    static func characterReplacement(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var maxFreq = 0
        
        let sToArray = Array(s)
        var freqDict: [Character: Int] = [:]
        
        
        for right in 0 ..< sToArray.count {
            let rightValue = sToArray[right]
            freqDict[rightValue, default: 0] += 1
            maxFreq = max(maxFreq, freqDict[rightValue]!)
            
            while (right - left + 1) - maxFreq > k {
                let leftChar = sToArray[left]
                freqDict[leftChar]! -= 1
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
}

extension Day14 {
    /*
     # ✅ 문제: Longest Subarray with At Most K Zeroes

     0과 1로 구성된 배열이 주어졌을 때,
     최대 K개의 0을 1로 바꿀 수 있다면
     **모두 1로 구성된 가장 긴 부분 배열의 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1,1,1,0,0,0,1,1,1,1,0], k = 2
     Output: 6  // [0,0] → [1,1]로 바꾸면 [1,1,1,1,1,1]
     ```

     ```swift
     Input: nums = [0,0,1,1,1,0,0], k = 0
     Output: 3  // 연속된 1의 최대 길이
     ```

     ```swift
     Input: nums = [1,0,1,0,1], k = 1
     Output: 4  // [1,0,1,0] → 한 개만 바꿔도 "1 1 1 0"
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10^5
     - nums[i]는 0 또는 1
     - 최대 k개의 0을 1로 바꿀 수 있음
     */
    
    static func longestOnes(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var zeroCount = 0
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            
            if rightValue == 0 {
                zeroCount += 1
            }
            
            while zeroCount > k {
                let leftValue = nums[left]
                if leftValue == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

extension Day14 {
    /*
     # ✅ 문제: Max Consecutive Ones III

     0과 1로 구성된 배열이 주어졌을 때,
     **최대 K개의 0을 1로 바꿔서 만들 수 있는 가장 긴 1의 연속 길이**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1,1,0,0,1,1,1,0,1], k = 2
     Output: 7  // [1,1,0,0,1,1,1] → 0을 2번 바꿔서 1로 만들 수 있음
     ```

     ```swift
     Input: nums = [0,0,0,1], k = 1
     Output: 2  // [0,1] 또는 [1,0]
     ```

     ```swift
     Input: nums = [1,1,1,1], k = 0
     Output: 4  // 이미 모두 1이므로 최대 길이 = 전체 길이
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10^5
     - nums[i]는 0 또는 1
     - 최대 k개의 0을 1로 바꿀 수 있음
     */
    static func longestOnesIII(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var zeroCount = 0
        var maxLength = 0
        
        for right in 0 ..< nums.count {
            let rightValue = nums[right]
            if rightValue == 0 {
                zeroCount += 1
            }
            
            while zeroCount > k {
                let leftValue = nums[left]
                if leftValue == 0 {
                    zeroCount -= 1
                }
                left += 1
            }
            
            maxLength = max(maxLength, right - left + 1)
        }
        
        return maxLength
    }
}

extension Day14 {
    /*
     # ✅ 문제: Count Number of Nice Subarrays

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **정확히 k개의 홀수를 포함하는 연속된 부분 배열(subarray)의 개수**를 구하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1,1,2,1,1], k = 3
     Output: 2
     // 두 가지 구간: [1,1,2,1], [1,2,1,1]
     ```

     ```swift
     Input: nums = [2,4,6], k = 1
     Output: 0
     // 홀수가 하나도 없어서 만족하는 구간 없음
     ```

     ```swift
     Input: nums = [2,2,2,1,2,2,1,2,2,2,1,2], k = 3
     Output: 3
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10^5
     - 1 <= nums[i] <= 10^5
     - 1 <= k <= nums.count
     */
    
    static func numberOfSubarrays(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixCount: [Int: Int] = [0: 1]
        var prefixOdd = 0
        var result = 0
        
        for num in nums {
            if num % 2 == 1 {
                prefixOdd += 1
            }
            
            result += prefixCount[prefixOdd - k, default: 0]
            prefixCount[prefixOdd, default: 0] += 1
        }
        return result
    }
}

extension Day14 {
    /*
     # ✅ 문제: Sliding Window Maximum

     정수 배열 `nums`와 정수 `k`가 주어졌을 때,
     **길이가 k인 모든 연속된 윈도우에서의 최대값을 배열로 반환**하세요.

     이 문제는 슬라이딩 윈도우 + 자료구조를 함께 사용하는 문제입니다.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
     Output: [3,3,5,5,6,7]
     // 윈도우: [1,3,-1], [3,-1,-3], [-1,-3,5], ...
     ```

     ```swift
     Input: nums = [9, 11], k = 2
     Output: [11]
     ```

     ```swift
     Input: nums = [4, -2], k = 2
     Output: [4]
     ```

     ---

     ### ❗️조건

     - 1 <= nums.count <= 10^5
     - -10^4 <= nums[i] <= 10^4
     - 1 <= k <= nums.count
     */
    static func maxSlidingWindow(
        _ nums: [Int],
        _ k: Int
    ) -> [Int] {
        // 시간복잡도 개선 필요
        var window = nums[0 ..< k]
        var maxValues = [window.max()!]
        
        for right in k ..< nums.count {
            let rightValue = nums[right]
            _ = window.removeFirst()
            window.append(rightValue)
            maxValues.append(window.max()!)
        }
        
        return maxValues
    }
}

extension Day14 {
    /*
     # ✅ 문제: 최소 윈도우 길이 합 조건 만족

     정수 배열 `nums`와 정수 `target`이 주어졌을 때,
     **연속된 부분 배열(subarray) 중 합이 `target` 이상이 되는 가장 짧은 길이를 반환**하세요.
     해당하는 부분 배열이 없으면 0을 반환하세요.

     ---

     ### ✳️ 입력 예시

     ```swift
     Input: nums = [2,3,1,2,4,3], target = 7
     Output: 2
     // [4,3]의 합이 7이고 길이 2가 최소
     ```

     ```swift
     Input: nums = [1,1,1,1,1,1,1], target = 11
     Output: 0
     ```

     ```swift
     Input: nums = [1,4,4], target = 4
     Output: 1
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
