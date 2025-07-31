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
