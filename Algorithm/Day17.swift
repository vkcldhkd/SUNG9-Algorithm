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
        
        var count = 0
        let n = nums.count
        
        for start in 0 ..< n {
            var sum = 0
            
            for end in start ..< n {
                sum += nums[end]
                
                if sum % k == 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
}
