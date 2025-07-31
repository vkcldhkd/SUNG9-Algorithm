//
//  Day17.swift
//  Algorithm
//
//  Created by HYUN SUNG on 7/31/25.
//

enum Day17 { }

extension Day17 {
    /*
     ✅ 문제: 모든 숫자가 서로 다르게 등장하는 부분 배열 개수 세기
     정수 배열 nums가 주어졌을 때,
     연속된 부분 배열(subarray) 중 모든 숫자가 각각 한 번씩만 등장하는 구간의 개수를 구하시오.

     ✳️ 입력 예시 1
     let nums = [1, 2, 1, 3]
     
     ✳️ 출력 예시 1
     6
     가능한 부분 배열:

     [1], [2], [1], [3] (각 원소)

     [1,2], [2,1], [1,3] (서로 다른 2개)

     ✳️ 입력 예시 2
     let nums = [1, 2, 3, 4]
     
     ✳️ 출력 예시 2
     10
     가능한 부분 배열:

     [1], [2], [3], [4]

     [1,2], [2,3], [3,4]

     [1,2,3], [2,3,4]

     [1,2,3,4]

     ✳️ 입력 예시 3
     let nums = [2, 2, 2]
     
     ✳️ 출력 예시 3
     3
     가능한 부분 배열: [2], [2], [2] (길이 1짜리만)

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    
    static func countUniqueSubarrays(_ nums: [Int]) -> Int {
        var result = 0
        
        for start in 0 ..< nums.count {
            var seen = Set<Int>()
            
            for end in start ..< nums.count {
                if seen.contains(nums[end]) {
                    break
                }
                seen.insert(nums[end])
                result += 1
            }
        }
        
        return result
    }
}


extension Day17 {
    /*
     ✅ 문제: 짝수로만 이루어진 연속 부분 배열의 개수 세기
     정수 배열 nums가 주어졌을 때,
     **모든 원소가 짝수로만 이루어진 연속 부분 배열(subarray)**의 개수를 구하시오.

     ✳️ 입력 예시 1
     
     let nums = [2, 4, 6]
     ✳️ 출력 예시 1
     
     6
     [2], [4], [6], [2,4], [4,6], [2,4,6]

     ✳️ 입력 예시 2
     
     let nums = [2, 1, 4, 6]
     ✳️ 출력 예시 2
     
     3
     [2], [4], [6]

     ✳️ 입력 예시 3
     
     let nums = [1, 3, 5]
     ✳️ 출력 예시 3
     
     0
     불가능

     ✳️ 입력 예시 4
     
     let nums = [2, 4, 1, 6, 8]
     ✳️ 출력 예시 4
     
     4
     [2], [4], [6], [8]

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    
    static func countAllEvenSubarrays(_ nums: [Int]) -> Int {
        
        let n = nums.count
        var result = 0
        
        for start in 0 ..< n {
            for end in start ..< n {
                if nums[end] % 2 != 0 {
                    break
                }
                result += 1
            }
        }
        
        return result
    }
}


extension Day17 {
    /*
     ✅ 문제: 홀수로만 이루어진 연속 부분 배열의 개수 세기
     정수 배열 nums가 주어졌을 때,
     **모든 원소가 홀수로만 이루어진 연속 부분 배열(subarray)**의 개수를 구하시오.

     ✳️ 입력 예시 1
     let nums = [1, 3, 5]
     
     ✳️ 출력 예시 1
     6
     [1], [3], [5], [1,3], [3,5], [1,3,5]

     ✳️ 입력 예시 2
     let nums = [1, 2, 3, 5]
     
     ✳️ 출력 예시 2
     3
     [1], [3], [5]

     ✳️ 입력 예시 3
     let nums = [2, 4, 6]
     
     ✳️ 출력 예시 3
     0

     ✳️ 입력 예시 4
     let nums = [1, 3, 2, 5, 7]
     
     ✳️ 출력 예시 4
     5
     [1], [3], [5], [7], [5,7]

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    
    static func countAllOddSubarrays(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        
        for start in 0 ..< n {
            for end in start ..< n {
                if nums[end] % 2 == 0 {
                    break
                }
                result += 1
            }
        }
        return result
    }
}

extension Day17 {
    /*
     ✅ 문제: 0과 1로 이루어진 배열에서 “1이 연속으로 3번 이상 등장하는 부분 배열의 개수”를 구하시오
     ✳️ 입력 예시 1
     swift
     복사
     편집
     let nums = [1, 1, 1, 0, 1, 1, 1, 1]
     ✳️ 출력 예시 1
     swift
     복사
     편집
     6
     가능한 부분 배열:

     [1,1,1] (0~2)

     [1,1,1,0] (0~3)

     [1,1,1,0,1] (0~4)

     [1,1,1,0,1,1] (0~5)

     [1,1,1,0,1,1,1] (0~6)

     [1,1,1,0,1,1,1,1] (0~7)

     (여기서 부분 배열이란 “서브어레이”, 즉 인덱스가 연속되는 구간임)

     ✳️ 입력 예시 2
     swift
     복사
     편집
     let nums = [1, 0, 1, 1, 1, 0, 1, 1]
     ✳️ 출력 예시 2
     swift
     복사
     편집
     3
     가능한 부분 배열:

     [1,1,1] (2~4)

     [1,1,1,0] (2~5)

     [1,1,1,0,1] (2~6)

     ✳️ 입력 예시 3
     swift
     복사
     편집
     let nums = [1, 1, 0, 1, 1]
     ✳️ 출력 예시 3
     swift
     복사
     편집
     0
     1이 3번 이상 연속으로 등장하는 구간이 없음

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     nums는 0과 1로만 구성됨
     */
    
    static func countSubarraysWithAtLeastThreeOnes(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        
        for start in 0 ..< n {
            var ones = 0
            
            for end in start ..< n {
                if nums[end] == 1 {
                    ones += 1
                    
                    if ones >= 3 {
                        result += 1
                    }
                } else {
                    ones = 0
                }
            }
        }
        return result
    }
}


extension Day17 {
    /*
     ✅ 문제:
     정수 배열 nums가 주어질 때,
     연속된 부분 배열(subarray) 중, 부분 배열의 합이 짝수인 경우의 수를 구하시오.

     ✳️ 입력 예시 1
     swift
     복사
     편집
     let nums = [1, 2, 3]
     ✳️ 출력 예시 1
     swift
     복사
     편집
     3
     [1, 2, 3] (합 6)

     [2] (합 2)

     [2, 3] (합 5, 홀수) — X

     [1] (합 1, 홀수) — X

     [3] (합 3, 홀수) — X

     [1, 2] (합 3, 홀수) — X

     [3] (합 3, 홀수) — X
     => 실제로는 [1,2,3], [2], [2,3] 이렇게 3개 (직접 코드로 재검증)

     ✳️ 입력 예시 2
     swift
     복사
     편집
     let nums = [2, 4, 6]
     ✳️ 출력 예시 2
     swift
     복사
     편집
     6
     [2], [4], [6], [2,4], [4,6], [2,4,6] (모두 짝수)

     ✳️ 입력 예시 3
     swift
     복사
     편집
     let nums = [1, 3, 5]
     ✳️ 출력 예시 3
     swift
     복사
     편집
     3
     [1, 3], [3, 5], [1, 3, 5]

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    
    static func countEvenSumSubarrays(_ nums: [Int]) -> Int {
        var count = 0
        
        let n = nums.count
        
        for start in 0 ..< n {
            var sum = 0
            
            for end in start ..< n {
                sum += nums[end]
                if sum % 2 == 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
}


extension Day17 {
    /*
     ✅ 문제:
     정수 배열 nums와 정수 k가 주어질 때,
     연속된 부분 배열(subarray) 중, 부분 배열의 합이 k의 배수인 경우의 수를 구하시오.

     ✳️ 입력 예시 1
     let nums = [1, 2, 3, 4, 5]
     let k = 3
     
     ✳️ 출력 예시 1
     4
     가능한 부분 배열: [3], [1,2], [1,2,3], [2,3,4]

     ✳️ 입력 예시 2
     let nums = [2, 4, 6, 8]
     let k = 4
     
     ✳️ 출력 예시 2
     4
     가능한 부분 배열: [4], [4,6], [8], [2,4,6,8]

     ✳️ 입력 예시 3
     let nums = [5, 5, 5]
     let k = 5
     
     ✳️ 출력 예시 3
     6
     가능한 부분 배열: [5], [5], [5], [5,5], [5,5], [5,5,5]

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     1 ≤ k ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
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
            
            var targetSum = prefixSum % k
            
            if targetSum < 0 {
                targetSum += 1
            }
            
            result += countDict[targetSum, default: 0]
            countDict[targetSum, default: 0] += 1
        }
        
        return result
    }
}

extension Day17 {
    /*
     # ✅ 문제: k로 나눈 나머지가 1인 부분 배열 개수 세기

     정수 배열 `nums`와 정수 `k`가 주어질 때,
     **모든 연속된 부분 배열 중 합을 k로 나눈 나머지가 정확히 1인 부분 배열의 개수**를 구하시오.

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

     - 가능한 부분 배열: [1], [2, 3], [4], [1, 2, 3, 4]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [5, 7, 1, 3]
     let k = 4
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```

     - 가능한 부분 배열: [5], [5, 7, 1], [1, 3]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1]
     let k = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     4
     ```

     - 가능한 부분 배열: [1], [1], [1], [1, 1, 1]

     ---

     ## ❗️조건
     - 1 ≤ `nums.count` ≤ 10⁵
     - -10⁴ ≤ `nums[i]` ≤ 10⁴
     - 1 ≤ `k` ≤ 10⁴
     */
    
    static func countSubarraysWithSumModuloOne(
        _ nums: [Int],
        _ k: Int
    ) -> Int {
        var prefixSum = 0
        var remainderCount: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            prefixSum += num
            var remainder = prefixSum % k
            
            // 음수 보정
            if remainder < 0 {
                remainder += k
            }
            
            // 이전에 등장한 (remainder - 1) 나머지의 개수를 결과에 추가
            let target = (remainder - 1 + k) % k
            result += remainderCount[target, default: 0]
            
            remainderCount[remainder, default: 0] += 1
        }
        
        return result
    }
}

extension Day17 {
    /*
     ✅ 문제: 첫 중복 숫자 찾기 (First Duplicate Number)
     배열이 주어졌을 때, 가장 먼저 두 번 등장하는 숫자를 반환하세요.
     가장 먼저 등장한다는 뜻은, 두 번째로 등장하는 위치가 가장 앞서는 숫자를 말합니다.

     ✳️ 입력 예시 1
     let nums = [2, 1, 3, 5, 3, 2]
     
     ✳️ 출력 예시 1
     3
     
     ✳️ 입력 예시 2
     let nums = [2, 4, 3, 5, 1]
     
     ✳️ 출력 예시 2
     -1
     
     ✳️ 입력 예시 3
     let nums = [1, 2, 1, 2, 3]
     
     ✳️ 출력 예시 3
     1
     
     ❗️조건
     1 ≤ nums.count ≤ 10⁵

     1 ≤ nums[i] ≤ 10⁵

     중복이 없다면 -1을 반환하세요.
     */
    static func firstDuplicate(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(num) {
                return num
            }
            set.insert(num)
        }
        
        return -1
    }
}

extension Day17 {
    /*
     # ✅ 문제: 가장 긴 고유 부분 문자열 (Longest Substring Without Repeating Characters)

     문자열이 주어졌을 때, 중복된 문자가 없는 가장 긴 부분 문자열의 길이를 구하세요.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let s = "abcabcbb"
     ```

     ## ✳️ 출력 예시 1
     ```swift
     3
     ```

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let s = "bbbbb"
     ```

     ## ✳️ 출력 예시 2
     ```swift
     1
     ```

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let s = "pwwkew"
     ```

     ## ✳️ 출력 예시 3
     ```swift
     3
     ```

     ---

     ## ❗️조건
     - 1 ≤ s.count ≤ 10⁵
     - 문자열은 알파벳 소문자로만 구성됩니다.
     */
    
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        var seen = Set<Character>()
        var left = s.startIndex
        var right = s.startIndex
        var maxLength = 0
        
        while right < s.endIndex {
            let char = s[right]
            if !seen.contains(char) {
                seen.insert(char)
                
                let length = s.distance(from: left, to: right) + 1
                maxLength = max(maxLength, length)
                right = s.index(after: right)
            } else {
                seen.remove(s[left])
                left = s.index(after: left)
            }
        }
        return maxLength
    }
}
