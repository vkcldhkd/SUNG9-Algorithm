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


extension Day16 {
    /*
     # ✅ 문제: 짝수와 홀수의 균형 구간 개수

     정수 배열 `nums`가 주어졌을 때, **연속된 부분 배열(subarray) 중 짝수의 개수와 홀수의 개수가 같은 구간의 개수**를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [1, 2, 3, 4]
     ```

     ## ✳️ 출력 예시
     ```swift
     2
     ```

     - 가능한 부분 배열: [1,2], [3,4]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 1, 2]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```

     - 가능한 부분 배열: [1,2], [2,1], [1,2], [1,2,1,2]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [2, 4, 6]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 모두 짝수이므로 균형이 맞는 구간이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - 0 ≤ nums[i] ≤ 10⁴
     - 시간복잡도: O(n)
     */
    
    static func countBalancedEvenOddSubarrays(_ nums: [Int]) -> Int {
        var sum = 0
        var count: [Int: Int] = [0: 1] 
        var result = 0

        for num in nums {
            if num % 2 == 0 { // 짝수면 +1, 홀수면 -1
                sum += 1
            } else {
                sum -= 1
            }

            // 누적합이 같은 시점은 그 사이의 부분 배열의 짝수와 홀수의 수가 같다는 뜻
            result += count[sum, default: 0]
            count[sum, default: 0] += 1
        }

        return result
    }
}

extension Day16 {
    /*
     # ✅ 문제: 0과 1의 균형 구간 개수

     0과 1로만 이루어진 배열 `nums`가 주어졌을 때, **연속된 부분 배열(subarray) 중 0과 1의 개수가 같은 구간의 개수**를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [0, 1, 0, 1]
     ```

     ## ✳️ 출력 예시
     ```swift
     4
     ```

     - 가능한 부분 배열: [0,1], [1,0], [0,1], [0,1,0,1]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [0, 0, 1, 1]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```

     - 가능한 부분 배열: [0,1], [0,0,1,1], [0,1,1], [1,1]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 0이 없으므로 균형을 이루는 구간이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - nums[i] ∈ {0, 1}
     - 시간복잡도: O(n)
     */
    
    static func countBalancedBinarySubarrays(_ nums: [Int]) -> Int {
        var sum = 0
        var count: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            if num == 0 {
                sum += 1
            } else {
                sum -= 1
            }
            
            result += count[sum, default: 0]
            count[sum, default: 0] += 1
        }
        
        return result
    }
}

extension Day16 {
    /*
     # ✅ 문제: 음수와 양수의 균형 구간 개수

     정수 배열 `nums`가 주어졌을 때, **연속된 부분 배열(subarray) 중 양수 개수와 음수 개수가 같은 구간의 개수**를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [1, -1, 1, -1]
     ```

     ## ✳️ 출력 예시
     ```swift
     4
     ```

     - 가능한 부분 배열: [1,-1], [-1,1], [1,-1], [1,-1,1,-1]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, -1, -1]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```

     - 가능한 부분 배열: [1,-1], [1,1,-1,-1], [1,-1,-1], [-1,-1]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [-1, -1, -1]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 양수가 없으므로 균형을 이루는 구간이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - 0은 주어지지 않음
     - 시간복잡도: O(n)
     */
    
    static func countBalancedPosNegSubarrays(_ nums: [Int]) -> Int {
        var sum = 0
        var count: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            if num > 0 {
                sum += 1
            } else {
                sum -= 1
            }
            
            result += count[sum, default: 0]
            count[sum, default: 0] += 1
        }
        
        return result
    }
}

extension Day16 {
    /*
     # ✅ 문제: 동일 숫자 개수 균형 구간 개수

     정수 배열 `nums`가 주어졌을 때, **연속된 부분 배열(subarray) 중 특정 두 수 a, b의 개수가 같은 구간의 개수**를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [1, 2, 1, 2, 1]
     let a = 1
     let b = 2
     ```

     ## ✳️ 출력 예시
     ```swift
     4
     ```

     - 가능한 부분 배열: [1,2], [2,1], [1,2], [1,2,1]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 3, 1, 2]
     let a = 1
     let b = 2
     ```

     ## ✳️ 출력 예시 2
     ```swift
     3
     ```

     - 가능한 부분 배열: [1,2], [2,3,1,2], [1,2]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [3, 3, 3]
     let a = 1
     let b = 2
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - a와 b가 존재하지 않으므로 균형 구간이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - -10⁴ ≤ nums[i], a, b ≤ 10⁴
     - a ≠ b
     - 시간복잡도: O(n)
     */
    static func countBalancedPairSubarrays(
        _ nums: [Int],
        _ a: Int,
        _ b: Int
    ) -> Int {
        var sum = 0
        var count: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            if num == a {
                sum += 1
            } else if num == b {
                sum -= 1
            }
            
            result += count[sum, default: 0]
            count[sum, default: 0] += 1
        }
        
        return result
    }
}


extension Day16 {
    /*
     # ✅ 문제: 3개의 숫자 균형 구간 개수

     정수 배열 `nums`가 주어졌을 때, **세 개의 숫자 a, b, c의 등장 횟수가 모두 같은 연속 부분 배열(subarray)의 개수**를 구하시오.

     ---

     ## ✳️ 입력 예시
     ```swift
     let nums = [1, 2, 3, 1, 2, 3]
     let a = 1
     let b = 2
     let c = 3
     ```

     ## ✳️ 출력 예시
     ```swift
     5
     ```

     - 가능한 부분 배열 수: 4개

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 2, 1, 2, 3, 3]
     let a = 1
     let b = 2
     let c = 3
     ```

     ## ✳️ 출력 예시 2
     ```swift
     2
     ```

     - 가능한 부분 배열 수: 2개

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 1, 1, 1]
     let a = 1
     let b = 2
     let c = 3
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - b와 c가 없으므로 균형 구간이 없음

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - -10⁴ ≤ nums[i], a, b, c ≤ 10⁴
     - a, b, c는 서로 다른 값
     - 시간복잡도: O(n)
     */
    
    static func countBalancedTripleSubarrays(
        _ nums: [Int],
        _ a: Int,
        _ b: Int,
        _ c: Int
    ) -> Int {
        var countA = 0, countB = 0, countC = 0
        var result = 0
        var dict: [String: Int] = ["0,0" : 1]
        
        for num in nums {
            switch num {
            case a: countA += 1
            case b: countB += 1
            case c: countC += 1
            default: continue
            }
            
            let key = "\(countA - countB),\(countA - countC)"
            result += dict[key, default: 0]
            dict[key, default: 0] += 1
        }
        
        return result
    }
}
