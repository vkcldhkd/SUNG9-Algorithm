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


extension Day16 {
    /*
     # ✅ 문제: 숫자 빈도수 동일 구간 개수 (누적합 기반 정식 정의)

     정수 배열 `nums`가 주어졌을 때, **서로 다른 두 숫자 x, y를 선택했을 때,
     x의 등장 횟수와 y의 등장 횟수가 같은 구간의 개수 중 최댓값**을 구하시오.

     > ✅ 단, 여기서 말하는 구간 개수는 누적합 기준으로 정의된 결과이며,
     > 누적합이 같은 상태가 반복된 시점 사이의 모든 부분 배열 조합의 개수입니다.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [1, 2, 1, 3, 2, 1, 3]
     ```

     ## ✳️ 출력 예시 1
     ```swift
     13
     ```

     - 예: (1,3)을 기준으로 누적합을 변환하면 sum = [1, 0, 1, 0, 1]
     - sum = 0 → 2번 등장 → 1개 구간
     - sum = 1 → 3번 등장 → 3개 구간
     - 전체 누적합 기반 균형 구간: 13

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [4, 4, 4, 4]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     0
     ```

     - 서로 다른 숫자가 없으므로 비교할 쌍이 없음

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [5, 1, 5, 1, 5, 1]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     9
     ```

     - (5,1) 변환: +1, -1 → sum: [1, 0, 1, 0, 1, 0]
     - sum = 0 → 4번 → 6개 구간
     - sum = 1 → 3번 → 3개 구간
     - 전체: 6 + 3 = 9

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 100,000
     - -10⁴ ≤ nums[i] ≤ 10⁴
     - 시간복잡도: O(M² * N), (M: 숫자 종류 수, N: 배열 길이)
     */
    
    static func maxBalancedPairSubarrayCount(_ nums: [Int]) -> Int {
        let unique = Set(nums)
        var result = 0

        for x in unique {
            for y in unique {
                if x >= y { continue } // 중복 방지

                var sum = 0
                var dict: [Int: Int] = [0: 1]
                var count = 0

                for num in nums {
                    if num == x {
                        sum += 1
                    } else if num == y {
                        sum -= 1
                    }
                    // 나머지는 무시 (0 변화)

                    count += dict[sum, default: 0]
                    dict[sum, default: 0] += 1
                }

                result = max(result, count)
            }
        }

        return result
    }
}



extension Day16 {
    /*
     # ✅ 문제: 0과 1의 등장 비율이 1:2 또는 2:1인 부분 배열의 개수

     0과 1로 이루어진 정수 배열 `nums`가 주어졌을 때,
     **0과 1의 등장 비율이 정확히 1:2 또는 2:1인 연속된 부분 배열(subarray)**의 개수를 구하시오.

     > ✅ 이 문제는 "정확히 해당 비율을 만족하는 모든 구간"을 직접 판별해야 하며,
     > 누적합 기반 접근은 수학적으로 변환 가능한 경우에 한함.

     ---

     ## ✳️ 입력 예시 1
     ```swift
     let nums = [0, 1, 1, 0, 0, 1]
     ```

     ## ✳️ 출력 예시 1
     ```swift
     5
     ```

     - 가능한 부분 배열:
       - [0,1,1], [1,1,0], [0,1,1,0], [1,0,0], [0,0,1]

     ---

     ## ✳️ 입력 예시 2
     ```swift
     let nums = [1, 1, 0, 0, 1, 0]
     ```

     ## ✳️ 출력 예시 2
     ```swift
     4
     ```

     - 가능한 부분 배열:
       - [1,1,0], [1,0,0], [0,0,1], [1,1,0,0]

     ---

     ## ✳️ 입력 예시 3
     ```swift
     let nums = [1, 0, 1, 0, 1, 0]
     ```

     ## ✳️ 출력 예시 3
     ```swift
     0
     ```

     - 모든 구간의 비율이 1:1 또는 다른 값

     ---

     ## ❗️조건
     - 1 ≤ nums.count ≤ 10⁵
     - 오직 0과 1로만 구성됨
     */
    
    static func countSubarraysWithZeroOneRatio(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0

        for start in 0 ..< n {
            var count0 = 0
            var count1 = 0

            for end in start ..< n {
                if nums[end] == 0 {
                    count0 += 1
                } else {
                    count1 += 1
                }

                // 정확히 1:2 또는 2:1 비율인 경우만 세기
                if (count0 > 0 && count1 > 0) &&
                    ((count0 * 2 == count1) || (count1 * 2 == count0)) {
                    result += 1
                }
            }
        }

        return result
    }
}

extension Day16 {
    /*
     # ✅ 문제: 동일한 값이 정확히 두 번 등장하는 부분 배열 개수 세기

     정수 배열 `nums`가 주어졌을 때,
     **어떤 숫자가 정확히 2번 등장하고 나머지는 등장하지 않는** 연속된 부분 배열(subarray)의 개수를 구하시오.

     > ✅ 예를 들어, [3, 3]은 3이 두 번 등장하고 나머지 숫자는 없으므로 유효한 부분 배열입니다.
     > 반면에 [3, 3, 1]은 1이 추가로 등장하므로 조건에 맞지 않습니다.

     ---

     ## ✳️ 입력 예시 1
     let nums = [1, 2, 1, 2, 3]
     
     ✳️ 출력 예시 1
     0
     유효한 부분 배열 없음

     ✳️ 입력 예시 2
     let nums = [4, 5, 4, 6, 5]
     
     ✳️ 출력 예시 2
     0
     유효한 부분 배열 없음

     ✳️ 입력 예시 3
     let nums = [7, 7, 7]
     
     ✳️ 출력 예시 3
     2
     가능한 부분 배열: [7,7] (앞쪽), [7,7] (뒤쪽)

     ❗️조건
     1 ≤ nums.count ≤ 10⁴

     각 요소는 0 ≤ num ≤ 10⁵
     */
    static func countSubarraysWithOneDuplicate(_ nums: [Int]) -> Int {
        var count = 0
        for i in 0 ..< nums.count - 1 {
            if nums[i] == nums[i+1] {
                count += 1
            }
        }
        return count
    }
}
