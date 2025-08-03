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

extension Day20 {
    /*
     # ✅ 문제: 동일한 숫자가 k번 **정확히** 등장하는 가장 짧은 부분 배열 길이 (유사 문제)

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **동일한 숫자가 정확히 k번 등장**하는 가장 짧은 **연속 부분 배열**의 길이를 구하세요.
     그런 배열이 없다면 0을 반환하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 2, 3, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     2
     ```

     - 가능한 부분 배열: `[2, 2]` (숫자 2가 정확히 2번 등장)

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 1]
     let k = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```

     - 가능한 부분 배열: `[1, 1, 1]` (숫자 1이 정확히 3번 등장)

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 2, 3]
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 어떤 숫자도 정확히 2번 등장하지 않음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁵
     */
    static func minLengthSubarrayWithElementExactlyKCount(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var countMap: [Int: Int] = [:]
        var targetCount = 0
        var minLength = Int.max

        for right in 0..<nums.count {
            let num = nums[right]
            countMap[num, default: 0] += 1

            if countMap[num] == k {
                targetCount += 1
            } else if countMap[num] == k + 1 {
                targetCount -= 1
            }

            while targetCount > 0 {
                minLength = min(minLength, right - left + 1)
                let leftNum = nums[left]
                countMap[leftNum, default: 0] -= 1

                if countMap[leftNum] == k - 1 {
                    targetCount -= 1
                } else if countMap[leftNum] == k {
                    targetCount += 1
                }

                if countMap[leftNum] == 0 {
                    countMap.removeValue(forKey: leftNum)
                }
                left += 1
            }
        }

        return minLength == Int.max ? 0 : minLength
    }
}

extension Day20 {
    /*
     # ✅ 문제: 동일한 숫자가 **최대 k번 이하** 등장하는 가장 긴 부분 배열 길이

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **동일한 숫자가 최대 k번 이하로 등장**하는 가장 긴 **연속 부분 배열**의 길이를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 2, 3, 1, 4]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     6
     ```

     - 모든 숫자가 2번 이하로 등장 → 전체 배열 가능

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 2, 2, 3]
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     5
     ```

     - 가능한 부분 배열: `[1, 1, 2, 2, 3]`

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [4, 4, 4, 4]
     let k = 1
     ```

     ## ✳️ 출력 예시 3
     ```swift
     1
     ```

     - 각 숫자가 1번 이하로 나와야 하므로, 길이 1까지 가능

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁵
     */
    
    static func maxLengthSubarrayWithEachElementAtMostK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var left = 0
        var maxLength = 0
        var countDict: [Int: Int] = [: ]
        
        for (right, num) in nums.enumerated() {
            countDict[num, default: 0] += 1
            
            while countDict[num, default: 0] > k {
                countDict[nums[left], default: 0] -= 1
                
                if countDict[nums[left]] == 0 {
                    countDict.removeValue(forKey: nums[left])
                }
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
}


extension Day20 {
    /*
     # ✅ 문제: 동일한 숫자가 **정확히 k번 등장하는 가장 긴 연속 부분 배열 길이**

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **배열 내 동일한 숫자가 정확히 k번 등장하는 가장 긴 연속 부분 배열의 길이**를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 2, 3, 1, 4]
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     5
     ```

     - `[2, 2, 3, 1]`은 숫자 `2`가 정확히 2번 등장

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 1, 2, 2, 3, 3]
     let k = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     5
     ```

     - `[1, 2, 2, 3, 3]`에서 2와 3이 각각 정확히 2번 등장

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [4, 4, 4, 4]
     let k = 3
     ```

     ## ✳️ 출력 예시 3
     ```swift
     3
     ```

     - `[4, 4, 4]`만 조건 만족

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - 1 ≤ k ≤ 10⁵
     */
    static func maxLengthSubarrayWithSomeElementExactlyK(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var countMap: [Int: Int] = [:]
        var left = 0
        var maxLength = 0
        var exactKSet: Set<Int> = []

        for right in 0..<nums.count {
            let num = nums[right]
            countMap[num, default: 0] += 1

            if countMap[num] == k {
                exactKSet.insert(num)
            } else if countMap[num] == k + 1 {
                exactKSet.remove(num)
            }

            while !exactKSet.isEmpty && countMap[exactKSet.first!]! > k {
                let leftNum = nums[left]
                countMap[leftNum, default: 0] -= 1
                if countMap[leftNum] == k {
                    exactKSet.insert(leftNum)
                } else if countMap[leftNum] ?? 0 < k {
                    exactKSet.remove(leftNum)
                }
                if countMap[leftNum] == 0 {
                    countMap.removeValue(forKey: leftNum)
                }
                left += 1
            }

            if !exactKSet.isEmpty {
                maxLength = max(maxLength, right - left + 1)
            }
        }
        return maxLength
    }
}

extension Day20 {
    /*
     
     # ✅ 문제: 가장 긴 동일한 문자 교체

     문자열 `s`가 주어질 때, 최대 `k`개의 문자를 임의의 다른 문자로 바꿔서 만들 수 있는 **같은 문자가 연속으로 반복되는 가장 긴 부분 문자열**의 길이를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "ABAB"
     let k = 2
     ```

     ## ✳️ 출력 예시 1
     ```swift
     4
     ```
     - 두 개의 'B'를 'A'로 바꾸면 `"AAAA"`가 되어 길이 4 가능.

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "AABABBA"
     let k = 1
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```
     - 'B' 하나를 'A'로 바꾸면 `"AABAAA"` 또는 `"AAABAA"` 가능.

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "ABAA"
     let k = 0
     ```

     ## ✳️ 출력 예시 3
     ```swift
     2
     ```
     - 바꿀 수 없으므로 `"AA"` 또는 `"AB"` 중 최대 길이 2.

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `s`는 대문자 알파벳으로만 구성됨.
     - `0 <= k <= s.count`
     */
    static func characterReplacement(
        _ s: String,
        _ k: Int
    ) -> Int {
        var left = 0
        var result = 0
        var maxCount = 0
        let chars = s.map { $0 }
        var charDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            charDict[char, default: 0] += 1
            maxCount = max(maxCount, charDict[char, default: 0])
            
            while (right - left + 1 - maxCount) > k {
                charDict[chars[left], default: 0] -= 1
                left += 1
            }
            result = max(result, right - left + 1)
        }
        
        return result
    }
}

extension Day20 {
    /*
     
     # ✅ 문제: 가장 긴 두 문자로 이루어진 부분 문자열

     문자열 `s`가 주어졌을 때, **서로 다른 문자 두 개로만 구성된 가장 긴 연속 부분 문자열**의 길이를 구하시오.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "eceba"
     ```

     ## ✳️ 출력 예시 1
     ```swift
     3
     ```
     - "ece" 가 조건을 만족하며 길이 3

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "ccaabbb"
     ```

     ## ✳️ 출력 예시 2
     ```swift
     5
     ```
     - "aabbb" 또는 "caabb" 둘 다 가능

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "aaaaa"
     ```

     ## ✳️ 출력 예시 3
     ```swift
     5
     ```
     - 하나의 문자만 있어도 조건을 만족 (문자 2개 이하)

     ---

     ## ❗️조건
     - `1 <= s.count <= 10^5`
     - `s`는 소문자 알파벳으로만 구성됨
     */
    static func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var left = 0
        var result = 0
        let chars = s.map { $0 }
        var freqDict: [Character: Int] = [: ]
        
        for (right, char) in chars.enumerated() {
            freqDict[char, default: 0] += 1
            
            while freqDict.count > 2 {
                let leftChar = chars[left]
                freqDict[leftChar, default: 0] -= 1
                if freqDict[leftChar] == 0 {
                    freqDict.removeValue(forKey: leftChar)
                }
                left += 1
            }
            
            result = max(result, right - left + 1)
        }
        
        return result
    }
}
